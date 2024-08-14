#!/usr/bin/env python3
'''
    This script contains the class Cache
    The instance of this class will be able to cache
    a value to a redis database
    '''


import redis
from typing import Union
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
        self._redis.flushall()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        '''  generate a random key (e.g. using uuid),
            store the input data in Redis
            using the random key and return the key
            '''
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key
