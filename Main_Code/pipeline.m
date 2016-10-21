function pipeline(annotation)

  training_files = dir(training_directory);
  test_files = dir(test_directory);
  
  %Read training files
  %skip the first things and the svn file
  disp('Reading training files and preprocessing images...');

  
  
  disp('Done!');
  
  
  disp('Training models...');
  models = trainAllModels(training_features,train_words);
  disp('Done!');
   
  
  disp('Reading test files and preprocessing images...');
  %Read test files
  for n = 4:size(training_files,1)
    image = imread([training_directory '/' training_files(n).name]);
    pre_processed_image = preProcessing(image);
    test_features(n) = extractFeatures(pre_processed_image);
    %imshow(image);
    %drawnow;
  end
  disp('Done!');
  
  [most_likely_words, likelihoods] = evaluateObservations(test_features,models,words);
  
  evaluateResutls(most_likely_words,test_words);
  
  
end
