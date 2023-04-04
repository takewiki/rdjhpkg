

#' Title 历史应收票据汇票等级更新
#'
#' @param input_excel 文件路径
#' @param token 口令
#'
#' @return 输出结果:"更新完成"
#' @export
#'
#' @examples pyrdjhmain(input_excel='需处理历史单据清单.xlsx', token='F91CF3E3-8962-47F2-823F-C5CCAAFC66CA')
#'
pyrdjhmain <- function(input_excel, token='F91CF3E3-8962-47F2-823F-C5CCAAFC66CA') {
  #注册python模板
  mdl <- tsda::import('pyrdjh.rdjhMain')
  #调用python函数，将.替代为$
  res <- mdl$main(input_excel=input_excel, token=token)
  #返回结果
  return('更新完成')
}


#' Title 读取文件
#'
#' @param input_excel 输入文件路径
#'
#' @return 输出datafram
#' @export
#'
#' @examples pyrdjhReadData('需处理历史单据清单.xlsx')
#'
pyrdjhReadData <- function(input_excel) {
  #注册python模板
  mdl <- tsda::import('pyrdjh.rdjhMain')
  #调用python函数，将.替代为$
  res <- mdl$ReadData(input_excel=input_excel)
  #返回结果
  return(res)
}



#' Title 更新汇票等级
#'
#' @param token 口令
#' @param df datafram数据
#'
#' @return 返回更新结果:更新成功
#' @export
#'
#' @examples pyrdjhUpdateDraftGrad(token=F91CF3E3-8962-47F2-823F-C5CCAAFC66CA, df=pyrdjhReadData('需处理历史单据清单.xlsx'))
pyrdjhUpdateDraftGrad <- function(token, df) {
  #注册python模板
  mdl <- tsda::import('pyrdjh.rdjhMain')
  #调用python函数，将.替代为$
  res <- mdl$UpdateDraftGrad(token=token, df=df)
  #返回结果
  return(res)
}


#' Title 查阅更新结果
#'
#' @param token 口令
#'
#' @return 返回更新结果
#' @export
#'
#' @examples pyrdjhres()
#' 
pyrdjhres <- function(token='F91CF3E3-8962-47F2-823F-C5CCAAFC66CA') {
  #注册python模板
  mdl <- tsda::import('pyrdjh.rdjhMain')
  #调用python函数，将.替代为$
  res <- mdl$readres(token=token)
  #返回结果
  return(res)
}


