#!/usr/bin/env python3
'''
    This script contains a function that inserts a new document
    in a collection based on kwargs
    '''


def insert_school(mongo_collection, **kwargs):
    ''' insert a new document with the kwargs property
        and return the new document id
        '''
    new_doument = mongo_collection.insert_one(kwargs)
    return new_doument.inserted_id
