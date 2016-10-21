function [upper_baseline, ascender_baseline, descender_baseline] = getBaselines(word, baseline)

      % Compute upper Baseline
      upper_baseline = upperBaselineEstimation(word);
      
      % Compute Ascender and Descender Baselines
      bw = im2bw(word, 0.8);
      bw_trans = (bw(2:end,:) - bw(1:end-1,:)) ~= 0 ;
      im_hist = sum(bw_trans,2);

      temp = find(im_hist ~= 0);
      
      ascender_baseline = temp(1) - 1;
      descender_baseline = temp(end) + 1;
      
      if descender_baseline < baseline
          descender_baseline = baseline;
      end
end