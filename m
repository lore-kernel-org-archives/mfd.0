Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CF849E126
	for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997606; cv=none; b=uRcScedMhgy9fKOaf9b/i1WkjK/FZSE3iIRc+oorOW17k4Zy3HAm/raKJ1MA3ALbxRLlDThCKjcPxa4aE4MXW0T+1vSN7jZo3+ujjXDbVXbaD4FxuV6ip/aCXYKfgVHdcNeAvL+L1pL8mMpIZdomlHRPiCAPC8zXepNX2DmTlfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997606; c=relaxed/simple;
	bh=Fw2WS59fAjQfg5J3rnz+u6bzFfRp61VAs/SzMqJv8mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XorDoN+Up3eWW62oNVxz9DWxf4biPXDYqOZuf0Z162jdPPhkuQoswGUSzzvkKBMcnYslIe6nqcrh6ABmeRXNWfq4LcK1hm0l81XGJ5AQkm0c9ei1Ks3H4Gc//Eh8RQXNmhwco16RYbaylOs3m91nmNZFQMUrbomYgk31+ja4iDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KSdZN3Pc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+nOCk+X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KSdZN3Pc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q+nOCk+X"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdxYP934235
	for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 13:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5J9RRSss6wNB2+tlXaGjp8FkDbVH1cRZmO7BFQ90LN4=; b=KSdZN3PccABMLK4t
	RwryNlwQZGngt8dcW0Fc+qp+uZMH6jlX/FGN1enkNqBa7mKCoLBTC81e1WNs9s7t
	WybPPD4jzIHm8uguy08LS46dDjl76DMfCI/ZOadAWW0XRsjST4KkOV1hnDLwEHxf
	GL8bOqzR2rXdaHhtxBpEyXzzTsGKo4cu3nxaNyfA7ZKhXIvpQvdOS0/26Js8GWIS
	mfNBcfdi4OSN6LoG7edt8/ABmGW8RSFsXqsx3eT+Vng9WYg6BImfMBd1cdfgBNE8
	ygSPVoBN3RP9wsMYgM/51bFY6AhKW6DFbKO3yunYvDZC+ODzemiwMOp0L1Xoipwh
	u4XCJw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8bausd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 13:33:21 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9806a17a7baso28648241.2
        for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 06:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789997600; x=1790602400; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5J9RRSss6wNB2+tlXaGjp8FkDbVH1cRZmO7BFQ90LN4=;
        b=Q+nOCk+X28jgkZ2S2OsiAj/4mn33qy/Ol68MS/Qlyflr3Cedx+t0IjpGuRNjSN4Ka0
         3HrZyWEaRqX6hlVOxEAlNbft5wU3tamG+EGx6o4GaNk6rP1Fvp7vWMQb2GODS7GnJKlM
         FaD72GO9NlDNQde0FZekw3ATx1cpfO61JnZs1tZDepehf2ywyhw7UhH2R5ym7EwYVxYM
         UFbYa+x4RsdoXQWnFjFkW6mlqeUrig923KQ2Wr1wd1NoJPQgo5ff0Jd/S+yRbmztMiX7
         Z4g7zWgQDkZ8kC9cTT/rDe/N8vlxBBMvSYXWQIk+8hIe3X2+FeM+wKsvwsAxsPiog7d8
         uapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789997600; x=1790602400;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5J9RRSss6wNB2+tlXaGjp8FkDbVH1cRZmO7BFQ90LN4=;
        b=mCZZgvC8+phONsZ3Sm7h/eXDExmoHfi8MzYMILv5V4hRs5VuCkJHLdvb2vp4Rdj1CB
         wAeZh9uLhPuQfW5EkMFZTtW7levp+a5+QJhEs10xv72gJyo3ipbQJrHKjZo26Q3HvLEi
         hepkkrjOGEaLJIh2s7yE4CJdpZR3LWV/C/ZpB10ciTnc31NkCzq5NqoCAVTaMnt0b0RF
         dCuI1x8uuXG2wGG3pWJo6+WRbFIMgQP8a9ML8apMvVsZpo5L8wnWz/pVs3j3v2ZL0yCX
         a5ytqM0bF3cYWw7MwAsMdxkdqZ+TXUpvSIRD2Gsw8S2QmtFFsceEwE0SxtCrZi32oCNO
         y0FQ==
X-Forwarded-Encrypted: i=1; AKwUvByAY+LxMXaFyRN9Mt1osAPxShKK2O4g9pupHvOgPRxYR2cT3FKiWKsrAVF+rhD7/R7xOco=@lists.linux.dev
X-Gm-Message-State: AFuF++k/B7wBTDlbUNLjSOtkRF0oMCO7ocvqNWGnwgGIx1TGdbgBT4m2
	JRAHnV/YbG2TD7K0+bKnhKIMaFKihWH61Cu9GJlZ2owmiNnel6PL0Ttt6WVMsoLgFtJ5cxNoZDw
	1puSldyTBMpBwfxleUUPnJeRiHMvAwMiBgw/+YJuL/IGduLWxGuwcS9E=
X-Gm-Gg: AYBFou25GqL5MRZ+dphgRp4GKD5OU2fcmqG2P0O0v1AeroGP6vvDq1d/L5g939KSN+m
	u2a338JmK68NvV1W8AmC37Je7rSSRmV3ajCz39Pat8rxyyV1gUwfjwO6G5vOT1DirbaoGyMZhbp
	SjyWwg4PibeVoL+IBdSyLEKXgfE8D1WS4CZKLidnobvVdyrnzk+pXA4wawFzseLyrSCo95OR04H
	/EJ+PQ6vmpMq+SXazUANhh5Htx1e5IrRg7PvVWg/vkxnu9agk6le9TENQTsz/YtAEkURfd9n0BF
	G5AnJX+D2cCoRAFbEeJxPAG4CwRbutkxYrhET3bVw9j4svw1nGaSw4I7EdJFfzK1DRyOqGfp4zm
	D9+5xMlVyBp2q9ySXHSmynw==
X-Received: by 2002:a05:6102:5808:b0:7a4:f9b5:ed2f with SMTP id ada2fe7eead31-7a556e125a1mr4474453137.0.1789997600346;
        Mon, 21 Sep 2026 06:33:20 -0700 (PDT)
X-Received: by 2002:a05:6102:5808:b0:7a4:f9b5:ed2f with SMTP id ada2fe7eead31-7a556e125a1mr4474370137.0.1789997599813;
        Mon, 21 Sep 2026 06:33:19 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a358dab38sm316743466b.57.2026.09.21.06.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 06:33:19 -0700 (PDT)
Message-ID: <90d203ad-525c-44dc-83d6-1548b42c131d@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 15:33:16 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mfd: qcom-pm8008: Add PM8010 support
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-4-de33d78fad9d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260918-pm8010_i2c_support-v1-4-de33d78fad9d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE5NiBTYWx0ZWRfXz4xnzLWG90Us
 rnWbMxKlU9gUExghbTehzyQmbQVEcx78XcV5iX27fFCktbHarVHSi6HuTY9nskC+RawkkaOv++8
 kxpV3ZZ2hwGUCSxCCIR3t2xTSofHv/ZUyF1BePdrM8MdwL/naqKdw6Sk0zwPYE6kxWReCaKOAw4
 r1v9LSYjdFFL7B2eEGXJZFJk9I2IPYkupnfIbk9h31qL3v0hIyidfuaujsgi+IWV95KFFDfJlT2
 xa740qZhb5eJ+wwi1yse8t39O8iwQutWf2rNosfGnWaKIctamNKTPhDoBtyFH3TrCV7EUJgDq+v
 v8Rp1aiNvvKrc00flCMBUExaxmXdcNkFHq06jER7HKT2jAlDTBM5r7omOn2SAvOK7i0jBFjZs2O
 c0Kvbyv80OISqHTXdDX62N2OstiwyDaLS+RqqEcnqyoJucRLuD3kVlOeWr5f/7/ylpSSidTugbt
 OF7m61/35kTmcQu0urg==
X-Proofpoint-GUID: _k5U5PuwtQEjKHYasZWjvT_uKE7N0z__
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab13221 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=of9sHuRbKvSQs4eXnhsA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: _k5U5PuwtQEjKHYasZWjvT_uKE7N0z__
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE5NiBTYWx0ZWRfX9xBb3MTsE8pP
 FiNrVviOMTm6FhrC+a6YZb9v1m0LHt5qssUQWRKO8BDWNnMWMop/6kAtCdr9CeJPdqVF4FQW/BY
 GnojDB6zAk4fAeOuuqpLDYVNNIOfScE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210196

On 9/18/26 6:42 PM, Jishnu Prakash wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> PM8010 is effectively the next generation of PM8008. The device is
> generally designed to serve the exact same function - power camera
> sensors and the associated supporting hardware.
> 
> PM8010 supports both I2C and SPMI communications. The latter case is
> already handled, since it reuses the same peripherals as other PMICs.
> The I2C front-end is more less the same to the one of PM8008.
> 
> Plumb in the necessary changes to support it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  drivers/mfd/qcom-pm8008.c | 67 ++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 63 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> index 60204cc9a2dc..ed656f0d6df2 100644
> --- a/drivers/mfd/qcom-pm8008.c
> +++ b/drivers/mfd/qcom-pm8008.c
> @@ -34,6 +34,7 @@ enum {
>  	PM8008_GPIO1,
>  	PM8008_GPIO2,
>  	PM8008_NUM_PERIPHS,
> +	PM8010_NUM_PERIPHS = 2,
>  };

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 8408d045e754..84c2d50545af 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -35,7 +35,9 @@
 enum {
        PM8008_MISC,
        PM8008_TEMP_ALARM,
-       PM8008_GPIO1,
+       /* The GPIOs on PM8010 are fixed-function */
+       PM8010_NUM_PERIPHS,
+       PM8008_GPIO1 = PM8010_NUM_PERIPHS,
        PM8008_GPIO2,
        PM8008_NUM_PERIPHS,


or drop the GPIO support altogether, if we conclude that they are
fixed-function on PM8008 too (I couldn't find clear info)

Konrad
