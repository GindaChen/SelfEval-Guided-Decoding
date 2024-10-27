import openai

def patch_completions__getitem__():
    def __getitem__(self, item):
        return self.__dict__[item]
    
    def __setitem__(self, item, value):
        self.__dict__[item] = value
    
    openai.Completion.__getitem__ = __getitem__
    openai.Completion.__setitem__ = __setitem__

    openai.types.completion.Completion.__getitem__ = __getitem__
    openai.types.completion.Completion.__setitem__ = __setitem__

    openai.types.completion_choice.CompletionChoice.__getitem__ = __getitem__
    openai.types.completion_choice.CompletionChoice.__setitem__ = __setitem__
    
    openai.types.completion_choice.Logprobs.__getitem__ = __getitem__
    openai.types.completion_choice.Logprobs.__setitem__ = __setitem__

patch_completions__getitem__()