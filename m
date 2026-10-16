Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7613E46A60B
	for <mfd@lists.linux.dev>; Fri, 16 Oct 2026 09:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144183; cv=none; b=br1TIYNqjFAlkpE5ncGp1Ym7gmz+eueYbE2AOiBbYN3IIiSwUTClQNUK+OPtlp9LoUdFXobj/EezQxeWVOkiCDeLL1C4vsBqixiUgfmeHekk7dxf8e29DNO83rg3jrLNAh03SY14NqooUiCZrdEGO67hblkqs7/zhVWP1HzPUec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144183; c=relaxed/simple;
	bh=sZ0YEEJM+nQC9l3aPVYzo33JA4V892pPBT/BXf8zA1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RdDouBZRCsIr1+MA/YDx/xuqLqSssHBABjki7lkDyi+ewuR9hCSNBhTBbRAo5M6Y7zxrIfjBTT5OZMXuN5izJwJYhWHCMxeP/9Btoca8SgX8UAk6PuVMmWnsS/j2GYijHNvrkRQxREgtNhoXa66tquO/E4Tbi8zDndG5y+QgLoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z8kwL6Sy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REsmjfYO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z8kwL6Sy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REsmjfYO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lM9i303585
	for <mfd@lists.linux.dev>; Fri, 16 Oct 2026 09:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	56f64g6oLreLCUIowP41hw9zucQESMG8NygFkLofNIY=; b=Z8kwL6SyCsVD+soQ
	dLZ5g8n8IPDPJb/2xXKCcv0FSJCpiksMujS9qNAgdwMq58UXKG096D2g8n3zm2Q3
	agk3+qSCNj4nw7GDTIUg4bkDc1J1ty4RCQdkU7YdOfrEQjUE/1f5sRJnKO8IBuW9
	kvDllT6dkS+/bwoXMXFpLIRnMQdkVnwkXXS9OLQLPjuRUqNMS/YypUpymFTrr4qT
	zZIrUuuInxYomymOWImDyarCNrb89gXWZJfmqXx9KHv+9kzI1WA4dtnRGk6L3wm3
	GtTFBFNDwx5IUTi+iJI/2hLit96ec6wFNRjErIeGlGWTAG3v6SEqLutlZYPRYgnr
	3IsXAA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjt98du-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 16 Oct 2026 09:49:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917ad3b42eeso15804026d6.1
        for <mfd@lists.linux.dev>; Fri, 16 Oct 2026 02:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792144181; x=1792748981; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56f64g6oLreLCUIowP41hw9zucQESMG8NygFkLofNIY=;
        b=REsmjfYOmm6WAn0y1q3jZWLCGNXCyw3Mq+dnI5s0kMr6PTy4l2NGop9FvSSfmPKclb
         nSMLqwU7NCNVIcwd4eXcqlv/gNhOfiq0WhU/6uqBkwoqHOulsuRcIY9S1qVbmLgoEEL3
         20H9S9dY2vUHNQFhjOkX3QrCLgQG9AgbWbA/6FrrtswO2qBu9ii3cgWJyCjKLiq4T6CB
         f4vFxS7rCUpBjro/0KEwLucltdqnOSf9kRejdbHrlX/6v1ORJTWN10gPrpmtswU4OX5i
         RZQbNeEEri7XMTN83KCdX1fYJL94MbPViAD4kk6ZHdQ8KyKuR2ZQerpPyd3CbgQbKc/r
         aw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144181; x=1792748981;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56f64g6oLreLCUIowP41hw9zucQESMG8NygFkLofNIY=;
        b=kRyGEZVmIwyfYgVSpLGSQheO9q3VFHyMTTwpWu09idDZZF+b89wypikqP68dL5KIi7
         pOVEdqfTH31r74j4SM+0EPfxt0cUmrAyAWrutVXFmX5fkGEaHGHM/HHJGXpCX3RECC8K
         3cq3kOqEuTWUfVpLSdhoLpE6fRxSsogaOJDNpfA+jQ1kZLD081g4w/Rbj9qqCLSvgJVH
         Y+SM5iZvjfXTaNRyOWITSw4e2fNtQ9VC3JD8k6k64qkETWR+POIri6bIeeoBYWJuSToJ
         gD5taVQvkvVoMbd6SQ6XcUjsxmtoc5cPNwldEp1t0PTgOjWqhT/ZeVZHFMNSeU/Qeb5S
         DE9Q==
X-Forwarded-Encrypted: i=1; AKwUvBx+tautjrz1uPs6j+4m1R/zOX0ukpzgGQvdZhQqzAyrQQeb6u2ERFW8jvzZ7XqktWdeifQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYLr+y+a6icnTIwqB7Ok8sMUfHF4BTw1rWRUJJnrQ38aEN4KhHgc
	MX837bx3FzenB5d0Rg6LISCSiQDAcscfQQo1zoV5f8Xgm3LtGiKZStFc+Qpl1AhoMQgNegTrIvn
	ZdM2zc62+cX4CBDKZ26VOGQPLB6ijUtOvG75nOdhI5PGNd5pUogAoA0E=
X-Gm-Gg: AYBFou3tOMFWMOZ4zqAzvdATdXKixoKN7dmgF5dF7CNIj2pXdcEZKJzr8WQlxd2w0Uq
	AwQ3FBg+z+ePcc1G49HmN7dTBWNAg/QcuzvVNp9DwtajNVyuoiltiBNlj84HeJKBVMr0GR5LuC1
	q0jBEUdREBGLl5wVCt+1kLl6MK7HWIhHbCszpd4YEz4OexpT7flCWOLLWqGlN6cwiDz7AEXwM0t
	M6+lCXvKYcbYkNJ872/KgRjw2XzIYQg3MCFQ1xZ86IIl1d1DtaBTurBygZEsbhYzrqU1BBFiVYf
	3n6Ab3CK7L400f8IOp3ToJsj7qyZTF4yb15EznFSpHkXBpMhUcYp/h3ZvcxlccnyflBoEdDJD7R
	E4MNy28kvLk1kcdlvqz9fYw==
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr4276517285a.5.1792144180504;
        Fri, 16 Oct 2026 02:49:40 -0700 (PDT)
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr4276515285a.5.1792144180098;
        Fri, 16 Oct 2026 02:49:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d6280sm690572a12.24.2026.10.16.02.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:49:38 -0700 (PDT)
Message-ID: <734a6666-e420-45ca-ab5b-f00a0a7aacfe@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:49:36 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: arduino-imola: add support for sound
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260930124607.1109167-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260930124607.1109167-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzOCBTYWx0ZWRfX8ttLpYmg6bE9
 DG6CwskzzhMcN1Gh50CznRT0Kukb8wgaszbtQ3JyFm3sHCut2IaO6KAWTct2mYervDFD75R6yDb
 O4fsx6q0OWPZU31o/mRmlgN/Gjf9So/IdvX2iVBW5uGScWLiCjZj60+s5A5mNQTWFQ+eaG6eoab
 /rA0rJoZ2Hq1cQ8mBQ8eRhhbAhXnvbwBT21gVJnJtBJL6Lr18g5fSvhVIcAvsMqyXfhLkr8JKew
 DndH9xvHts0sMfpf6098Fw2/D4778q9p9yDZWZECVi6ziHnVSZT1qegkhW60oQaBSA4z4NKEIPa
 2B9r+XOB3+YRhBhyZv0+Cbhg2t4y+6Yq6w/M7ImonqJofC3iHYYcDGAv5q8cb/ZrU6vjwbPXEUD
 1dJjs/BAarNzLGewrAdnaVLnIj8Pa3w/XPx4r9xaMEyaEgPD9P+h0GqUDQd9Z8d87InyPGornOU
 ZzfhPtGlrlUlCOB7DXQ==
X-Proofpoint-ORIG-GUID: -nHMggGJ4lb4gcXDyFSxKpvjemMORhti
X-Proofpoint-GUID: -nHMggGJ4lb4gcXDyFSxKpvjemMORhti
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzOCBTYWx0ZWRfX036OQlNPr1eM
 8f0kSTGI1HpLqvnQt7hF7xmn614d+Etx/fAuXK5G+n49lqSLzrdk2d2XzIUMTBF/rtQDbm8kq7v
 fQNzTdI+t7WeWNKCB16u1pG+/sUsSOk=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad1f335 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=iMdRMZ7CqAKYY1MXlagA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160038

On 9/30/26 2:46 PM, Srinivas Kandagatla wrote:
> Add support for sound on Arduino UNO Q board, which includes
> - Headset playback and record.
> - Lineout
> - Ear Out
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
