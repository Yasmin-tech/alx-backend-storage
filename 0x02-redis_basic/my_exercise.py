#!/usr/bin/env python3
'''
    This script contains the class Cache
    The instance of this class will be able to cache
    a value to a redis database
    '''


import redis
from typing import Union, Callable, Optional
import uuid


class Cache():
    '''
        Cache value in memory with redis

        __init__:
             store an instance of the Redis client as a private variable
             named _redis (using redis.Redis())
             and flush the instance using flushdb

        Instance Methods:

            def store():
                generate a random key (e.g. using uuid),
                store the input data in Redis
                using the random key and return the key
        '''

    def __init__(self) -> None:
        '''store an instance of the Redis client as a private variable
        named _redis (using redis.Redis())
        and flush the instance using flushdb
        '''
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        '''  generate a random key (e.g. using uuid),
            store the input data in Redis
            using the random key and return the key
            '''
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

    def get(self,
            key: str,
            fn: Optional[
                Callable[[bytes], Union[str, bytes, int, float]]
                ] = None) -> Union[str, bytes, int, float]:
        '''
            convert the data back to the desired format usign fn
            '''
        value = self._redis.get(key)
        if value is None:
            return None

        if fn:
            return fn(value)

        return value

    def get_int(self, key: str) -> Optional[int]:
        '''
            convert the value returned from redis to int
            '''
        return self.get(key, lambda v: int(v))

    def get_str(self, key: str) -> Optional[str]:
        '''
            convert the value returned from redis to str
            '''
        return self.get(key, lambda v: v.decode("utf-8"))
