Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794578592;
	b=cUVEoB6wuwgMEgLmtmpJ3OCYps23LBbyYCf/v/UV7Gnv+0KE5SYsy6dhQte8S7n4iBVv
	 3N0OA/gli7r2R820RH4UWCF3vy6ta17CuUSGq0YLvsoiiWA7yfcD5FEuEmIRSd3+pYfhA
	 vfB+/eC+f39/0L2eBMrV9BRb4kBPQt4JvAE2sS+8JDowGq52vV5X/pOHkfDw8zTx5eNs5
	 6O/xJSvRNrWptOExRhF75rittX3B54IHuwvkJL7SliYUO5n8z4lKbZDJ/K+z3IIYruy2Z
	 rEiNiBQ9/9EW2b6IU0R4+z5gaXfc+LqDAJfc4MxCsridxTQmjuByqMHQqzk7nUxjefw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578592;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PUQvuhQRh7K4F7zLr9SKJq7YllsW7TnD6WQcJABt4hk=;
	b=HQUQscxY4QtzJ+9vUeJK9XawwSEMHXKxjMabFXqETTOcNOOU3qXld+PhsdEyP3PTC7vE
	 HFLNN3LNZ4Mu2KeIaWPBJQWkqRl81aabkay87lliLbQ1o2rbex37JR1BWeIbFdawmuy8U
	 Var90DFSOk3I2opHs3dKjUA3Ov0PfKndLOSjyLCvWbK7+oeZxCPRMdj+weyJQpOtveXEJ
	 CztVsalu7UgBElHMINqpAFMRn12CUW6QZcG3KiDWNAQXAUyksRAgFYlgNoRAVE9JLuUVz
	 dwpXUy1JNXwVO1dmESyuyvyIWJqZfapocFByeOoQvoORkCgttxYKcHb2cqo4tx/jhrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BpIKcwok;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JL473y5q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4995606A32D
	for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 14:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4995606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BpIKcwok;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JL473y5q
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCKQRD3126271
	for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 14:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PUQvuhQRh7K4F7zLr9SKJq7Y
	llsW7TnD6WQcJABt4hk=; b=BpIKcwokkcfc473Wb1waaTQpz24CG5t2Drjgdfyh
	QAi1XuzySvCtkG84x7BQQqMIXbGfWGCd5ZBT4c9tXoIm9IY2z1fu2/ADsPhBUBjO
	ip3FWYgji6ko/SsIA9YxBcFO0gwqOPD8+elVqrBmJHlvu7l3Tyv4DOJMhDl6QsMK
	racnnoP2S6ZvmxFaSCE9VL+lb46SY+AUEyhmAzfH+1ccI89hZIBVV1OjyrYTnA7e
	5PckpEik4d9HtCOBJtWb11yPWzhA63A7CHMqUb/iNh7usiwfJ/UGOjjeGeeBFBqK
	VelUSdjsvXturnL0DjSwxVn4eNahUQhXRNYSz4S5Ygug7A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bcahg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 14:03:10 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c83124d530so1791550e0c.2
        for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 06:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794578590; x=1795183390; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PUQvuhQRh7K4F7zLr9SKJq7YllsW7TnD6WQcJABt4hk=;
        b=JL473y5qxHJSvdYDBNaayH3IGQTHdc9L9QwjQaFIA5w2YTh4hkMvz3AvG6yGKrzXqS
         sPMGDIH90gk3XlOKGivRAQt3IRhsYU8kERzf7syITIjGO2ZAWp4yqz/ATtza9H2UaBth
         bYUnJtgMd4WCSMdTrz/Lz9t55MRJz3hqtzIqs6v1jefoF7REYp1NPnGqceRzMSHtZWpp
         71dDtyBORVjg7nXhuvqi0hY/mBRwxX5SwK/fuQA1L+tvU2R8GMrdiBvlbm/dbsxHan6S
         ljvgc1QFSFWqEjUMFoLRdARH4lDm4zdwSayxW6B31tJonKQmQxVTTqYzcCIXfOPA1Bxj
         VmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794578590; x=1795183390;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PUQvuhQRh7K4F7zLr9SKJq7YllsW7TnD6WQcJABt4hk=;
        b=ZuP9Zw4hxYCX2RcUuQF38oZ3tI8LSf0pIKqKNED+aGHZqkxioY+yn4ph77Yz6GQxoR
         TG8i9wZVbpiFTFljn7gjKovz5AtYnxjRspGyfkYtS41eBnpo5NYEXCtEpPOvffK1TXHg
         uP/BoG0L12aZBx2rujS/b+3j/E2Arrn71Kurc9WIKVkRAzkGpVrnw4D7bQWUoGHUUvD7
         c4YAkb/fSyIb1MErCBlOoVV4fbIFL2+g8QnxRoZyeuaRjY88pW9eMHJgcRuhFaBcgJG5
         ElHwNqXtgIbh/sQZEVvTSOTt1pZlvtV0+tgXH/GvyyzOhtNeIrfJKiTeHR32yHZ4xkdv
         PaIA==
X-Forwarded-Encrypted: i=1; AL+hErHlAj7U/YeUuRsSlwUppY4oMDLR/+UaIl022kpuQDqU2BQux10MuRldayC0ETaNhe+AFUk=@lists.linux.dev
X-Gm-Message-State: APuU4Z8OpAfzJsafkmUB5noaJDRuItDOrjyw2IZ/n7DWW7WYmvtgGSyp
	prSqr+uh9NIy5uUeOj4XiQigOnWAvCt4M+suCszuSaI7RT+GciQAYX+e8HGoUTWc1YAmno2vpvg
	gYzsVm5oUHRfDK0fvuvaY+Av1XoChgilJrHtmda0MEb+tfxyFMLZLILA=
X-Gm-Gg: AYBFou1Ntn3OcNpvjFXO4LaWr/cG38B4lxzRbJ6aAf5/FZqb8Cf0O/DkBhWXGOfUwsh
	nhqZ/d0A+J7ZQ6QPr9J4v0fdP318Em8K80SvRWJm3hn+tNaN0Xsh/IdldZeY2qktgZYif5fWthY
	CSes2/1y8gyL+d3Ex9LmcKLjR8o+3RdYQ3H1OX8M5TkQRjgmvsCtJ/hXuLf9HPNdytFTUUTPmNC
	UN6CmP1Qi//3IUM4DI7pFponpu7FpNuoJj/pn0bHLdsnERImGGuZYFuBzB5sxhRCzQpslmiRpvd
	jS/4l56T+e9eEn6ezAqHZWg07pDfaQipAAPch/kWPmZnwBE6vl5zNEAQ6ZC9IsdIIcdxqEx8KWB
	lGh5VgSgxiiaRf3fQ7BmBQUtYLcHa74jiXjX28jFulKLmlnhxHJBzOPsmQL3CvLyY7XHwelWkTL
	1Hh6G1pE/+wdyE7XiUaXR88ugP3dQdVghhUtGddrnDmq3Ju01lNNadUmwLMpNFig==
X-Received: by 2002:a05:6122:e22f:b0:5ee:200a:8cb7 with SMTP id 71dfb90a1353d-5ee34aaf256mr861248e0c.17.1794578589707;
        Fri, 13 Nov 2026 06:03:09 -0800 (PST)
X-Received: by 2002:a05:6122:e22f:b0:5ee:200a:8cb7 with SMTP id 71dfb90a1353d-5ee34aaf256mr861204e0c.17.1794578589099;
        Fri, 13 Nov 2026 06:03:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171348084sm769004e87.54.2026.11.13.06.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:03:07 -0800 (PST)
Date: Fri, 13 Nov 2026 16:03:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: Add MSM8996 SAW3 compatible
Message-ID: <ooeojpbsljfgaj5iuzkobibqfv7stvklom32pzqtivswquosew@dfsj4s6cnkbp>
References: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
 <45da00b9-c7f5-4c4a-a310-00c2ba94cf6e@oss.qualcomm.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45da00b9-c7f5-4c4a-a310-00c2ba94cf6e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af7189e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=PDbGYQxuVRdfQqe5cAkA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: nNKWprjLMdMFA7GEQRdK8JVRBXyEOxTj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1NSBTYWx0ZWRfX4xfPlrA9+F6l
 N6l0yh9UBvGRU+89rlMDO0FPmxiEP4eQPUOvZ0jvA2r/do8+22S3rAkMhyhl333JwgmGRvfutze
 ONZB79Rhw19N8EdNQulsDIULyKtHbUQqj68Wf9kRUrTNyBz1X0w5uVHRsB3oEnGLacoxnHXxN04
 7ZOPgL9b6tFoAOe/8wu9Nl7G3G4kt1KKf5pxiu01fnGaZXbQl7sQBrcUxbtsVtpVfUTbpidHIoZ
 cUdweN3+dBpk86/NWGRFrFrodH5Mh67cEJtZtAwPb2rNWmrkgzaHmF3boG07tWVDFY9fNrPGZyG
 Hx/lr9XVYE5T8hkUgqzoa8U/hOEv5bhIOKew3gMrIb9iHxzS6ySbUnViCQheHXM25jUOQB7YIgE
 H7r7N5pIr/b3qwfWk9CiBihxbC64OhtTTa2zOYbP4SMvzxmnJYLr5ieBUpN0z+iCi93bpI1PT2R
 0/WgQnppuJHAqLTaP5Q==
X-Proofpoint-ORIG-GUID: nNKWprjLMdMFA7GEQRdK8JVRBXyEOxTj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1NSBTYWx0ZWRfX2cRN1Df/xXKD
 4BMBOQSRgGIvRxl99I24twpaItSR4BeiuYqLw1SM2KZ7sqBtmbXlHbAIpPaHtKPaa3DlpMxsVP3
 467zopwAZsokGHBjS/1Uouxp1IPST1Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130055

On Fri, Nov 13, 2026 at 08:52:08AM +0100, Konrad Dybcio wrote:
> On 11/12/26 9:26 PM, Rob Herring (Arm) wrote:
> > 'syscon' nodes are required to have specific compatibles, but the 
> > MSM8996 SAW3 nodes are lacking one. This series adds one.
> > 
> > The binding should be applied with the dts changes to avoid new 
> > warnings.
> > 
> > Rob
> 
> I know this has been a thorn in our side for a long long time.
> 
> I believe +Dmitry had recently come up with some patches to describe
> it "properly" - are they any different from this series, Dmitry?

No, on MSM8996 the CBF SAW3 block doesn't need extra programming, only
the voltage change sequence, which is already implemented. Historically
I tried to control the SAW/SPM directly, reinit it and set the AVS, but
it seems it was a mistake. Pending patches (sorry) from my side don't
touch the SAW, the CPR3 uses the APCC regulator as is.

> 
> Konrad

-- 
With best wishes
Dmitry
