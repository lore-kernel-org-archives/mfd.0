Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809453;
	b=thnH1SgsuQxIl/PVlDcjEjhJ7rK7jjQ2ab7/c4SJR2ffbuz87ASgzQYLtZelwUF75e26
	 yNeKEgZD4ORmdudciiA4lb+nYjWY8+4lR6wUbFfZHgTS79hOzJtv1R8BV69YCg2iNNQdV
	 zM0vv6VMCyc42bsJgH/VoLeKWSe0ySpwY1QWx/HdIwtO+QmDVwNipd46wGY2IL1Jir1AB
	 LQt04fiPpSVX7VxiIhrQ1+jk6+O4lDk4ch3osrtRL5k1pRpVmBuav88IckBkZyUnw+8+E
	 TuYUH9VAHKHcNhRFt1xEzi6hRSpWpuQzNt76TcDA8VdDF1gXA3L26qhb423Y267JkpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809453;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5Jxiry9vwgyxS5ZS37aNjiYx6GYa6EgvSiPtoxpaBk4=;
	b=HeuoLVb1RqezLM8/yQmCRcFk4y2RWU8tfbZXupfKhSDzEXdN1PbzV/hRCqd52josLi5+
	 qmvHl7cuso30oLm0ZQvhq9rjKQLhsaRxXGaB7DAtSbC6qk3C9B/rL9q3f9awv57VJYRdL
	 AHr4p3O+UMCPbX1UzWND82lsXH+3hQgBPUDVoqHkMAzPmMkg7RS/TB1cyN7wPyO4uKoWS
	 /gmG2MIi1YR8BT/1U+B2R/bEE3p/bv7slkTnGgtWgov2rvpUrXTjZt/iqflgW/N0Xvbfg
	 RedYKmssjQoz1I1Av2cOKCtbfqtqfxZBXY7x56KS+T1awb9K8FL/iA3aaF3iDGoELtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OaQ5e15P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nt3wSwsc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D233606A329
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D233606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OaQ5e15P;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nt3wSwsc
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5Lo2O323077
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Jxiry9vwgyxS5ZS37aNjiYx6GYa6EgvSiPtoxpaBk4=; b=OaQ5e15PJX8yGqJ5
	bsHWfMCv4B1VKFn1Z7HYMNi2p63/ZRu/tfaDIBawEwUx6vE0WEpxsqbsFjMY1Prg
	hAUMdyW9qSoVA0q0XYePoQZ3A8igSVgPfqOz4zle51bjeoyR7gvwiM2XJoWBrvUT
	wHS8XRtE+FwnweUcXGU6FSwxPL+Y2/tzs+n0Di32qMbBH8BcKdQdkwJHtM88CVxx
	6oIW88BIuINX7f9L7STw1BjO6eGJ4KpC9yhvNV9ay5r97i+zROQIPu0a1gOMhH9O
	TMa291/2Xp2gD7UUHQx/TPIBQfPCyYe40tc7HnY/GceFLzfgUCYzFZA9hkWitIe4
	SUCgIQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx55ht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:10:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed08904845so13085865ad.3
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 22:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794809450; x=1795414250; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Jxiry9vwgyxS5ZS37aNjiYx6GYa6EgvSiPtoxpaBk4=;
        b=Nt3wSwscCfVi5S2cTzYI3P76bGjyTmslztCoLBtBTMZO3R4GPtv6NKjuLm60l1bvCy
         XsWUjXl3jJ7UlC1m0+TgEy1MsAfp791ibAee35uEeF/JxyqSJui1MnnlMZfHxAxz9Usn
         z4J75KciNNIUBkV4EYReFSfZ6fYsbOZ+8OBOCzd5NFD3pwk7loSU4xfW6e2xoGDBID6s
         Fh/Oex6a8jhujzj8J+2HABV2T9aVxfGd/uLqdtZS41W6Jlg1q36CGTyPHF7k/mSwsXtz
         qW2eUcDEZihFQLcJaCQJamI9VRGJ2jkY7wgNk3ZGgLR1XcjGCWA2cyFTwD0J6K8w0Y8L
         0BwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809450; x=1795414250;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Jxiry9vwgyxS5ZS37aNjiYx6GYa6EgvSiPtoxpaBk4=;
        b=vxmXHrfN+1vioeT0OZhHEo0BtqFgtn0JWKutd1jM4dSjs4FiSthTFm7JW8bILm0uRW
         3KzpTWxMp1QvJETvg+Ogltw7dO5M1VLdGdNgBHc1hcuYWbPhFH9miVKv3fB7Cg4WAHXF
         f2w8fY9EW7HnrKXByl6zrynvFSVRbqQVrLh27zMiLJRgazQt7xiqo+grauhxrcPAtNNs
         YsLn4Em6rT7C9Ii56S2hT3bq9pTtALCsbrEfAPC4S/cdZmingV7k1n2Q7hEgkyRo4kpC
         zKYKuNjlSLBtjTbxX13UkmqGEkeMnSJA4x7LElJJ+gB9f6Go6pcz9/dMldpPKK8cFioi
         xA2g==
X-Gm-Message-State: APuU4Z/RzT7AJapasFh6GauC9zsFNNpKVCSZkP0S7rtQoXLl8ghGqHLw
	XjDYmkV1eF2sG5gwSKMkr9dHisqu3+c7gDr8YGwYXcDIJIAK5QtGpemobAEkpa2bmCXdnNHNg6a
	e1mUHXG00dh4yrHlqyhtjKIMPVUCxw9+qsREO4gB/bHvmPvlmUunSD5k=
X-Gm-Gg: AZFdTZf7VoWmvOJoG7GWxWPvo7RIE7yrfEudsQruT6PpEw78h3UO0V3t5JmmhX7ex7X
	LRhCVsrssLCnwjavGn7/lj54y4Be7wy17HV0inR3gqShpc08KoOVJt+exspcg0EVwOaQuYvH+yk
	qFrHJ0AFTR3tf+rFWAGf2EI6NEgUecrvGxokSoP5ssS3LE3WMLEveEYLtR+MUvX7FAvmayMjlE/
	od+B/Qq+5VfaS4TBwQu803o1++CCzPwjLN7FtqztrJkloaf+ZVz9ENn++cq9fNARNsNglU7QHWu
	adrj6q5J9jXu4VvKh09jX6idU6q39jlDolWHkiMziIlnOF34waaI3UurvhLUc7tAxgYpauxV37u
	5OWeRVLfb53UTRSl1XjZfd//09oODiuAqIUmO3VHDUd7BCtsAnnMzMEmVWde5DqQJvJf0ick9eY
	SDaw==
X-Received: by 2002:a17:90a:c2cf:b0:3ac:74b3:a8f3 with SMTP id 98e67ed59e1d1-3b1b0ccec81mr8961213a91.44.1794809449716;
        Sun, 15 Nov 2026 22:10:49 -0800 (PST)
X-Received: by 2002:a17:90a:c2cf:b0:3ac:74b3:a8f3 with SMTP id 98e67ed59e1d1-3b1b0ccec81mr8961191a91.44.1794809449195;
        Sun, 15 Nov 2026 22:10:49 -0800 (PST)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27cf1sm21087463a91.12.2026.11.15.22.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 22:10:48 -0800 (PST)
Message-ID: <bbf095b6-83c5-4d77-8837-873e29d093d0@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:40:45 +0530
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] regulator: pm8008: Add mode voting support for
 PM8010
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, lee@kernel.org
References: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
 <20261111-pm8010_i2c_support-v4-3-4549cab1c8e4@oss.qualcomm.com>
 <sashiko-outbox-209409@kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-209409@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfXz8aQQcSaWqQB
 ux2zLWMlbr9dqnnKbKs03y2tQeTISjBXvoCu8+hgat/GV2O2g7FTt/SHzfmX60Dij7mJhKGVh6s
 sASRJNkZsN+7VqdLq76dUDubWm/brKWV8mujVIZ5M3QMzffWikE/KpwDXyy3IID57qAUmk4ST9B
 lI26NFb6xfBiHdhmjAgoofzNSxBkfPrlMTne8niY90zpxxeLIAkNy7jj0f337SUSA06J2Uh/aMn
 UMYnGTMUp4bNAQ/+Phy0aRvWM+dytt87saw+BeAvVbq1Duiqo2PA0wG7Z/CpjH/Ak5bQdHuOcJ4
 lsO9rJgYX9yul5rXRYf94YHxoQIUHI2ADummpDy+oq+Bkdsi1JlOE/OKkpxd+aazFMD6p//BJRM
 +eyGEug175nunjAK9ueHAbUXqu6APucqhXZ/psQWi0VhXPMLwICoFDiTWsFWr1EJh6gOv0RQZO3
 VEt9b/XJ8c7lC7uTjkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX6EuSAvMUY/oO
 Tyrt2Ydamn+i+Zncu6aHuj26NOQ9VP3g8JG4fiWEdXxR32Gt9k0hfXjS9NDy+UaTSzRDCOmySci
 0KxUA0P09pKS3T/ottY5y4v0CaRnwnk=
X-Proofpoint-ORIG-GUID: 2PAqeDlyfr64gi9d2WM-9iu_gxCdEgk8
X-Proofpoint-GUID: 2PAqeDlyfr64gi9d2WM-9iu_gxCdEgk8
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6afa9e6a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=m2CrskostU30fZ5MlgQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160024

On 11/11/2026 10:57 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] regulator: pm8008: wrong hpm_min_load_uA for PM8010 L1/L2 in
>   pm8010_reg_data
> --
> 
> commit e894320c5a690e879a2556e289265d1ae5f7176f
> Author: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> regulator: pm8008: Add mode voting support for PM8010
> 
> This commit adds set_mode, get_mode, and get_optimum_mode support for
> PM8010 LDO1 and LDO2 in the pm8008 regulator driver.
> 
>> diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
>> index 0ea4ac016dc22..395d5582f6af0 100644
>> --- a/drivers/regulator/qcom-pm8008-regulator.c
>> +++ b/drivers/regulator/qcom-pm8008-regulator.c
> 
> [ ... ]
> 
>> @@ -84,9 +97,10 @@ static const struct pm8008_regulator_data pm8008_reg_data[] = {
>>  	PM8008_REGULATOR("ldo7", "vdd-l7",    0x4600, 200000, pm8008_pldo_ranges),
>>  };
>>  
>> +/* LPM setting is supported for only N-type LDOs of PM8010 (L1 and L2) */
>>  static const struct pm8008_regulator_data pm8010_reg_data[] = {
>> -	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 172000, pm8010_nldo_ranges),
>> -	PM8008_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 172000, pm8010_nldo_ranges),
>> +	PM8010_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 172000, pm8010_nldo_ranges, 100000),
>> +	PM8010_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 172000, pm8010_nldo_ranges, 100000),
> 
> [Severity: Medium]
> Should hpm_min_load_uA for ldo1 and ldo2 in pm8010_reg_data be 30000
> instead of 100000?
> 
> In drivers/regulator/qcom-rpmh-regulator.c, pm8010_vreg_data defines the
> same PM8010 LDO1 and LDO2 regulators using pmic5_nldo502, which sets
> hpm_min_load_uA to 30000 (30 mA):

It's possible there was an issue with the HW document I checked
in this case. I'll update this value to 30000 as it's known
to be working.

Thanks,
Jishnu

> 
> drivers/regulator/qcom-rpmh-regulator.c:pmic5_nldo502 {
>     ...
> 	.hpm_min_load_uA = 30000,
> 	.pmic_mode_map = pmic_mode_map_pmic5_ldo,
>     ...
> }
> 
> With hpm_min_load_uA set to 100000, pm8010_regulator_get_optimum_mode()
> keeps LDO1 and LDO2 in REGULATOR_MODE_IDLE (LDO_MODE_LPM) when consumers
> request loads between 30000 uA and 99999 uA via regulator_set_load(),
> which can cause output droop or brownout under moderate loads.
> 

