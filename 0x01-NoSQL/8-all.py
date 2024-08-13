#!/usr/bin/env python3
'''
    This script contains the function list_all that list all document in
    the givin collection
    '''


def list_all(mongo_collection):
    ''' Lists all documents in a collection
        '''
    documents = mongo_collection.find()
    if not documents:
        return []
    return documents
