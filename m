Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688776;
	b=HPo4WyDCBrFR7Db/qw+j7VdnMjPF70L7lJjSoWHd0s1t3iUp2ai2wnAcubcu0Jj0gD9A
	 T+qAx8CTlzrqLg7zRhxR2s0eSyv1pO6e1Q8zIot3YCCpYADE/zAtNMis5OyZpI4/ElXBs
	 8W/BA4U1Dl7xIzfSoslJHnK4Ge4zxyDIh9/tYjlIWd0P7UBOOt3q6zetifJClLA+cpx2/
	 e6cDKkrd1dPLcK2Tw5PUQ+gfAIZnLHfMEDSCcFy/FT4kE4xuqBZW/M/f+iwIjHDRxDl8T
	 R+pTHkDhs8FMnhIxdpbku0HvC6XQLM2T9wc+ppxTH86i+e5JGIroABNXoORjKM2o22A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688776;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XhxMGmx3cJqWJXPqYIFBE/9itvYC5Soa02DOwUt5Ksk=;
	b=TBCzRZp4RBfsgtTbPjUVmv5O3lkCl5TlRZIesZWOAiZ/BLdD8bHbszYJZ++uf2Aat21b
	 Wl0wz2k0pEBmFKFROh0UuQELQLF/lLmvv+nyU9e/8SUKCt0oR2DTP7TLlk858XlbhRpmJ
	 ZNgOPd5atSbt6eBGx7FavkLuuk1b5edKaIdf/LeQwkodphESC0VIdi52Uicwg4F/TsOb5
	 h3p56A1klyE9tCfzAmGYVMbF5l2Uz+nfZRxsaUicyQweG28xem9ujdzcnAN38fl7rsBjk
	 JW7Fvlzr//W1LefNMLekBwnd2X6bTl4+HGhUQSy1/uwDL2XyC/HkuEGC6iSu6OBJcvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i5lJGnF4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="CrsCWR/T";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63793606A321
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 10:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63793606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i5lJGnF4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CrsCWR/T
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B30R2210829
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 10:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XhxMGmx3cJqWJXPqYIFBE/9itvYC5Soa02DOwUt5Ksk=; b=i5lJGnF4//4uynHl
	2fu/QwxJDg4YM8WIVlJR5yzhCv3egiSmybo0IzbE/1WSyCh6bZowCeOSenWLdMNr
	Yfwaj+B705by2Z27lCCV1LieK+R2LwXKAgnrnwiSDujnoVZdCldukk9kxHzknhOp
	MmpFqiEzkvqT/brCf30FwKkA8S+BByC9q0/sgruwRfNkfBGhqyxnhodYsM0kwN1o
	/5m9XxaZCbx0JWkSlQ6Qhi4RI2VEQHxUg/f9vidoDMxYtK3XTjMD5DcTeRka0tEe
	r4beDKGBvjyVTClG4RloaiaDQgJGnuKm9JobpwJhz9cbVa22bCw+QS2rAgfkT7Hg
	AxvP1w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfagmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 10:26:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55c4997063aso19313631cf.2
        for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 02:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688775; x=1796293575; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhxMGmx3cJqWJXPqYIFBE/9itvYC5Soa02DOwUt5Ksk=;
        b=CrsCWR/TuS99C89huMhUASOQSSehXY7xptuCQn9NkGvFUqCxBneJSNpaAyuQcsnoim
         sqnbi8iabB1slTIC+3iaYUga4dGpr+XgYGWAmNKKp8Xkny9zurWa8IxNNq+ll7Aoz4Ea
         X9+jZZzhmQLB7jMVZXgETlLHris8P43dL8jzI2OYDVtlwRDbsNxGriAAXoqNiZM4mXRQ
         VpHDTE7MZypRMNn8hemeabvzpZFxgT+Yd6FidIzaqavjOZbpx6dVSKzqBuEjRDlP1B+m
         HtfH1GrtAKn4gdNaL0qTT1trDFfrxnd7Nrry0t3EaIqUY9n39E915fCV1ReUcB1rdtJT
         9U2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688775; x=1796293575;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhxMGmx3cJqWJXPqYIFBE/9itvYC5Soa02DOwUt5Ksk=;
        b=f6nh5erv9Ef6lyLOXL3unvXh388Bo7b0oF3/a0NTtfZfh3t4uexyLibTVlV/dACfD4
         D6Jd6P6i4f96cQzbjvMUhXvVAcgykMQRixWgwHcuC+eNUBQ2zPysDVAyWYePbohUg0Je
         soxZDVo74KzY4BxMcQfoVP8NZjwISBEU7Wev6YviEXKPIJFBr6boJuyXw7hn+nVLtkrH
         AogBy1gEivR2WCk3tD0V4Yov6zUaGCvLmtbRTWoLsnPEIq2PoaM0U6okvrzgHF45xThS
         /sxakPFG+7XO5Qr4XA6llyWcqNHeG71Ump0v5ov+mvDW8tSE2R4uQZRj1epRIfOJgY41
         7tMA==
X-Forwarded-Encrypted: i=1; AL+hErHZOlW6NdSL8rAaW1+2fPT0AmkjpPjjIU1OPtz6bmeBshtnmoLVKycGwekhJFG+0+ENNMg=@lists.linux.dev
X-Gm-Message-State: APuU4Z/Mrji6TJD95NH2NRH965+EfYDMig5SEfzmriaxckIW4sLW2N9x
	F4xjvXtzuqNxaoRdGo8bQV1mZsWBEJ/kTuN4mJfUYgN05S8pQbc/4kKgQEj6CD/4N5Vk2tOiqLl
	p4+1N4jAfhmUGBJYF/yhzLFXDLroFEKH16eh34GGnXnmlxuMWGCYfB/E=
X-Gm-Gg: AZFdTZd06Zn/W7+QGM8SIcEVXXX+lKt0LZqryr/azDDkWT+9zTLeW6HQIwtUomyhgN6
	2985W3f9hZiZJgsksLfy2OQ+DK2IL1TCl/x4ul6Ppdy1ERrN6chsgCFjrML2sOePjqH0/H3cE7m
	nAJIhN+I5HLk4GxGW/wc/Hb/kuLumP5CLDErxbjGjOxt+y5y75g5bxY2EzmJi1KyB7npI34kueb
	gv7oEuJenW/z6GE2Ud414Gq/j3VPKDI77615cLHLls4srbeq5AVqMyEB9sicO8b1KX9gMtMMbB6
	3/LW0PJ9bphbFUtmfDmRhdWcCBAiguu5bsvnB25EzDTra9DK/zc0gOJN3NkDf8DXnBei9h8RVJu
	A3pRfUqUcNfVfWz6q8g1KszXKohdokkM4SMLvpHV+mPw6jO2pgQvA/njgHttUz8blFb3PpJo=
X-Received: by 2002:a05:620a:a8cc:10b0:939:8148:1e3d with SMTP id af79cd13be357-949ba891b7emr3307660385a.2.1795688774798;
        Thu, 26 Nov 2026 02:26:14 -0800 (PST)
X-Received: by 2002:a05:620a:a8cc:10b0:939:8148:1e3d with SMTP id af79cd13be357-949ba891b7emr3307656785a.2.1795688774355;
        Thu, 26 Nov 2026 02:26:14 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aec5115sm732536466b.51.2026.11.26.02.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 02:26:13 -0800 (PST)
Message-ID: <4f19aecf-acd2-485f-983e-d10e82eb91b3@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:26:10 +0100
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
Subject: Re: [PATCH v5 3/7] regulator: pm8008: Add mode voting support for
 PM8010
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
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
 <20261116-pm8010_i2c_support-v5-3-5626ba17c0fb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-pm8010_i2c_support-v5-3-5626ba17c0fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hTe1SN4s6RTTxcszD8nK4wGlMtW4HKw5
X-Proofpoint-GUID: hTe1SN4s6RTTxcszD8nK4wGlMtW4HKw5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXw4WVdgfe6N/M
 PU0SBu4hKPoNoqV8JmKaTsV3nuAQEQto558pFkVTPPS9z0LfheKg02Q+vpcUjzV81zuvadK7mYX
 pQbeBMNBu8CUY3jZlRZGKvMGEnhn1r0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXy3XmYdeTlH7W
 zw4d7xVDfDPkJ3JSOji/Xj6iishadZaBoNjnbSDoskBhCBlKf9RALFtO1KNMoUmXZA0DvCJJxES
 u9TzaImFs9EegZghgpQK2PeFxI7xn/RSAIpbJIdK/PhwF0lYd0RcZjlVkQkE1jc1vjBlWyFIEDM
 OKtES+OmqVxcbTRnLWUMqvFFcEGunxQgDZ4Qh2hQWWt5GCKGzFZjWiMBqeIoB1nAaLRaLU8kmy7
 0tdkeWj7NjFeN3SpJ0SSEiJZsm2X3gdIaukQJf7aDTXBdtukmPRpsONlIZ+c85zK8oyegc9H/qi
 ClzlofY8/zoimygCZTtjtMyrO3DihFTxznQiyIeAQFWqpkUuYGYEzsmTMto/5Hi6eKTI2Z9sjRL
 jL+YKMeFWR+l9XwJNf2J4JwSOjGkqcg6YOG8OTZMkv1nYjvCHwhWiuS4e+JjQVhLwawmKgGrqeZ
 QDP+NSziUWvmBvmUKhw==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b080947 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_U4GOqps37RzzdhOo_IA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

On 11/16/26 7:13 AM, Jishnu Prakash wrote:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> Implement set_mode/get_mode/get_optimum_mode support for PM8010 LDOs
> using the mode control and status registers to allow clients to vote
> for LDO modes. Mode voting is supported for L1 and L2 alone of PM8010
> LDOs and not supported for any of the PM8008 LDOs.
> 
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
