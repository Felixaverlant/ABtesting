# Introduction
R functions that let you measure if a A/B test :
- has the same conversion rate
- that a version is more efficiente than another one.  

It use the N - 1 two-proportion test algorithm.

Check http://www.measuringusability.com/ab-calc.php for a quick test.

# Functions
You have 2 functions :
- same_conv : Probability that the two versions have the same conversion rate as (in %),
- conv_interval : Return the lowest & highest conversion rates based on a confidence interval set (in %). It returns a list : $low & $high.

## same_conv
| arg           | Desc                                      | Type| Mandatory  |
| ------------- |:-----------------------------------------:| ---:| ----------:| 
| visits A      | Total number of visits of version A       | Num | Yes        |
| visits B      | Total number of visits of version B       | Num | Yes        |
| conversions A | Total number of conversions of version A  | Num | Yes        |
| conversions B | Total number of conversions of version B  | Num | Yes        |


## conv_interval
| arg                 | Desc                                             | Type| Mandatory  |
| ------------------- |:------------------------------------------------:| ---:| ----------:| 
| confidence interval | Confidence interval (expressed as %. Ex : 0.90)  | Num | Yes        |
| visits A            | Total number of visits of version A              | Num | Yes        |
| visits B            | Total number of visits of version B              | Num | Yes        |
| conversions A       | Total number of conversions of version A         | Num | Yes        |
| conversions B       | Total number of conversions of version B         | Num | Yes        |

### conv_interval results selection
- conv_interval(args*)$low
- conv_interval(args*)$high