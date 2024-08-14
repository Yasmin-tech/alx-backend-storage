#!/usr/bin/env python3
'''
    This script contains a function that returns
    the list of school having a specific topic
    '''


def schools_by_topic(mongo_collection, topic):
    ''' returns the list of school having a specific topic
        '''
    results = mongo_collection.find({'topics': topic})
    return [doc for doc in results]
