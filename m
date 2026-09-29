Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9719346771
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687870; cv=none; b=uJhgq9fxayClELipwcL00xrYmv9ul7D0UWDvgtd1ZCTJp5Vh/2eXNVe4iHumFNepktwxYrv53tuC8gTjbjBKNIHJm1TA4S0AjB1D8jOGDeMA0BWlq/WI/RIKO6VRAZMmh0qZNPmbLCk9Bn4CVntm/Uj5/RW6Tc3ZBR9WhtaL0nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687870; c=relaxed/simple;
	bh=9uITES1c+z1LwEDwwhjcHSvT6lcopxRkz7KYTY2wSgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+8O9Ymc/3NWJOik8eMIWCLgP5gXmh8sqn7/6k04Dve+LdJVDarzXN6lG90osUHhgiYHiY8iSe0gUvD8ehn+mIWKenxIXV/Gxjy7suLxmYmwFjSnI9YSs/ib5BNybaGzZ4N+TbM1ukq/2pZO5kF+eqoL84N+hUO37rUnGpgq8OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PMfaLW/Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R4txMQ9y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PMfaLW/Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R4txMQ9y"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqim3611688
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hOM6D8WYiBBJwNCJU5OIk+JD
	Q8hRCCk2RfwO7zCPqXg=; b=PMfaLW/YrGuBxy1SB7cio23SoWepq8x6J0tt4O/I
	0Qmp4rots+8j4MIA1GQ1qw3ECR6GcRyMMOqqY4FX7leyLzHoGUHcj3XhbAuNMkQy
	X5lhfjXcy/JnTgdlyTfaG17rz0Bs6bzCXTR1vaZy8yU0LiYEaaJ0YGvwYl9CiWLF
	QsJK7zowDZgO8CMzrvT4fdu1OOICh9R88sj9cA57GzA/o4Ud4Xo5uCVpZzi1Fei4
	SgUK2tu6wyoaVfSZDSQTa68pW0IxF84egKFdmeYpVS1TXopbjQAGhyvs6eiLotS1
	BI4DnZz6kWOu/H25YV2+JEdDDtK1Q8yycEsvslSD3eHHAQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4u7yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:17:48 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b3cd4ce08fso496756137.2
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 06:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687867; x=1791292667; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hOM6D8WYiBBJwNCJU5OIk+JDQ8hRCCk2RfwO7zCPqXg=;
        b=R4txMQ9y8b/5fwq7VTkdKJb0g1wJCorH8iOpZxnwVNsw0ebrqJOpLPZxzIdMw+x9dQ
         QG8EdCpH5r+fSOoyL6d5/fxt4VR6xalpgcSk2BAdmySRzQpEoRIem5lC2a8kmHQxdoka
         F6xzhkGYce6l/fB0d4pRCM8wbLZL81lyjiWD97ATKMybL6lex+GJlMuR0xgkBKGwG8J7
         fnFxj2TGnCSf26btVVK/dnNs0vtm209NXscUEjqQ00qFacN1xwt7mopfrMzmOkzvRlpm
         plJaMPBmOWgt4sab2Dlszi3WTabzPPTQ/OB+ksCsJXBaTubOqWKPfHbnYmrzcvKTW+w4
         b1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687867; x=1791292667;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOM6D8WYiBBJwNCJU5OIk+JDQ8hRCCk2RfwO7zCPqXg=;
        b=KaX2sn6y/EQBr1ALk60zygmQbudFCapBJEN3IQSLBRuorhDboTlz3UIeSyoT0/ewAk
         81/mHKnWfSdFBHC9G9TsNO9C2tObmHUCesmsadwTEBBcml5NOtzPcplPnsYVGRf1GL0Y
         f8vwo9hIycKVLWmvRiiGHKikS3YK4nFBIew7cj1m59L3zxne/IlwPz0SJl+mtKkEGCry
         18fM4RhtMTSVaP3F4JTSNw0u3X+pBxcNFzffJsYo8cBLg3O1yczGTQgfbE93GsC8Q99i
         guY6GeoZ2txydPGfGwG9gjP79QvO8IH3rGtLZn+Fy1L9UESDd67Si987wv9/jCVhSAiQ
         XE3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwzndMw/aQuElAzzqp6sOFpFxQG0OQnHRWcNwymydMOyEEXdj94QFrPrPgeXQEw1IjcYT4=@lists.linux.dev
X-Gm-Message-State: AFq9FYJSpggfEf4vNuE8vP/3uihusghmnIfEJTrPWdR/QpmLY/IVGHtU
	LeJIS10G4hcn3yk7Pm5LgqcMig1mTBFoE8yYZ1yqL+9sgvWQWM2lCPna2IuSQAKYNb5ciK7Ak1D
	qkc/53h7E8A7mEZ1lEn0Co+ugcFYRLxTZldfIPp0U6pIIKUBoCn0VLCQ=
X-Gm-Gg: AYBFou1guD0HF7W/TZjOgRKOP047kDlyM0oJ/d5isyrV+xlejGaz+XGhD3k5kt6Bx+2
	EidlBevkWw4i9vAk53y4NTLUfAC8k/vPVCBv0p9f8MiPfehWf3fSETVChGOldyCPovdBlpin+eN
	I2EO8jWNHptZVG545RRZW8vuxwf4yW4SMFTNPAabnvN00LU/v12uzjwvtw3b1XD226YY0imY8aZ
	jyuO3uvKo+0vZzqZPtyc1ANtcJPelMDW7r181k+YV7s9CqXgtPlmFAdkCIu61IQEu34CUlOKH2R
	OFa2oUv65nbH/nN+WMejRHJAcMn7w4eWAhAuP/fTlvr9Y42ctgSxhQKAIPdbaFg7vNz0mU/GGAI
	5l+RcPYwKtYokuNQ=
X-Received: by 2002:a05:6102:390b:b0:7a4:c3b9:1e99 with SMTP id ada2fe7eead31-7af1e9f582amr4743126137.19.1790687866883;
        Tue, 29 Sep 2026 06:17:46 -0700 (PDT)
X-Received: by 2002:a05:6102:390b:b0:7a4:c3b9:1e99 with SMTP id ada2fe7eead31-7af1e9f582amr4743103137.19.1790687866208;
        Tue, 29 Sep 2026 06:17:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfe13a1sm76923395e9.5.2026.09.29.06.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:17:45 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:17:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 04/12] arm64: dts: qcom: pm7250b: Enable BCL sensor
 node
Message-ID: <nqpxb3zpvlpzw5ots6otyr7v662q6ql2dk2sies5w64fvrfbhh@5xd2nixnjnii>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-4-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-4-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX0r3BpX05X9ra
 8Fa5lJlwJ+zcazBPT05iwTY/EVgcfH/ajsQa1sB4mntrjILrjPKMOcBrb9qlALu4UEDMRTK/EAS
 66xH6+GPgELG15k7Vi5QLVatva8ESR4=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abbba7c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_82NC3t17uPQdkoQo54A:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX5C16vBXpMCcZ
 RqCHoMZcAXwqpKovEtWqcE70voDBdN/ob1vuWqR3KAtMdVg7lNNV59pCSAxIMQ174uwmSKyBBS5
 09uA3rpKbN6UfVpJ0VfOe0E6dvLlX3R2krEueWCi53pnD4TzjMfUt4pwfN+oBdJLXFfgWO6y0in
 CzUevFBQhRawMgms+98eSJu+IMI4DOUsWe9xe7A3o1/nt+FOfvL8p9hUIXZsQTy9dokL1FOiY6i
 aLFjGoOqa9RMIO3LSfEoU2kyvmBest5k/hKc51BH6V09NDpZLsrxw9nFDGin2m8PShRu87MgAxk
 bavO0rmffg7qI8T3o1rMFNE74EVm1sSe+2OhnNPfPhFqurxDnbBdRTfrb616DTy8Aun7RjPNiPu
 hOnxOrEKg8OlBCKYetQm2fZ/yLOcF04ZRYq88fz8DjpR749qspHpGNnRcqIQTcIYiwXo31Iku3F
 ULp4N6bVWQ4Oi0fqhWA==
X-Proofpoint-GUID: PUrvnz1oDjf9yuaQvJFmVF0sU3l1Bicy
X-Proofpoint-ORIG-GUID: PUrvnz1oDjf9yuaQvJFmVF0sU3l1Bicy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

On 26-09-29 18:39:36, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm7250b
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
