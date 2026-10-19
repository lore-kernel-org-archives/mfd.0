Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC4E4052B7
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 05:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792386049; cv=none; b=lV9wrA4UWDpHqLggKtb6o2sc1LGekSB4ngQqe3vfBCjUSsWJH/xmnzwK9LIbMJqQ+n96y1iZNf+UEQSWuxwsKl4bz6uCR8mgmV4sjyR/Oh2QbXoWh8YXw9b+ynURDJPm+WU32tWgYyDTY3pzx7iSJOAJza/D2WNKbF5taeOek9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792386049; c=relaxed/simple;
	bh=K+4QUmI2FHemQsCM6LPm+IF7KDqWjOzPmXdCgDeqkBI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mHVdOdmbz3IvepO2W2pyAwZaapSg8mTWp7oRkmYfQQ1JymYAKorsKr35/giq/MwFkN/sthAABJA0ZO6TvHivE+yN7VjUnI8H0EBTo0mKL8L8GBIhIV1jQ5EHbrJ8Kd6Ub0eGL2XPcxIlRESGIDxUsnonYIYoHsJGtsx2yam/fCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Knfxpf3F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HR7RUQpx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Knfxpf3F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HR7RUQpx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4jDId240196
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 05:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hx0fhj8bMrjech0/jwiRrwoQsgXvjpvMtyi96ZF6zus=; b=Knfxpf3FhlkJsxF3
	OODYRgnnR8u2ryagWKXc7CSl76CDKpXaDCrkVP+tc+ZlqQB1St3F0LLTrKYjnWl2
	g/SMxidwxcTYUjpHP501UN+OgXLa4AIANvREd11o6cbyZ+m3Ra16ExIdFnSgmsPW
	RAHboGxPOu+1jEv/Iqpi/1yunewm6aJGJOeDVJ2jMN7zeJNhymaPrd1IdxqJPMll
	f1K/vPa1PceF0DfhN+j8rJmiKyGzB2hweDgy4FRJicqtMbx8odMGo8Gp9Q+wfPxe
	gUVVrFiNIzVvQp0SsjY8OGt21xhvFLumfGu8DWr9TdgwS0WnS3Ha6Lx4idJMnUNq
	ePZ4sA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc26k4r90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 05:00:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9821ca96fso17515735ad.0
        for <mfd@lists.linux.dev>; Sun, 18 Oct 2026 22:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792386043; x=1792990843; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hx0fhj8bMrjech0/jwiRrwoQsgXvjpvMtyi96ZF6zus=;
        b=HR7RUQpxee1afpJABDroorWqrCWz+i+fI3C7FKv50J4znvZZeBBLNsYuUbO5iHqtrv
         PDZSkZSpjsooUDXMK6mfoc9C43Xn45iA79G44izULZkC/ZuY9i9KJcUEijJ0xkPBgZjt
         XvXO2kjou4dkYc9Bxsa2MsjrC0nuETwzWIv1COhWM3WZByhftbFITJFO4Go07XZRptZv
         ms3lBYcUedynEvUbBeLcOamWGH3nV/tlsOvoTvpbW8cigffAAX1qbwERRiunWmnaGJc6
         afj1ipW+TQcN5vqDmlVT7QW1QOKpVBRnWn2NM0cK6wUlIzpApADLAEDWNV0hoZxFFDPk
         cuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792386043; x=1792990843;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hx0fhj8bMrjech0/jwiRrwoQsgXvjpvMtyi96ZF6zus=;
        b=bdfykEQlYSkv74/nGdpDcjGFo4IZdJL8sCfXXqW24ZJ7CfEWaRgQjqF+DL4Pe62EJt
         TBCrnrwr0cF+dBGORiHWTqojsXHcXgGaOZYxSUIlDZ91JbjC1lbtFEeS71Idai2+BGNt
         936fcIN3LE4Zf4SNmbcBJgrDoNdXA8oxqfPleSyWFdwyAJy/Zz8y5dFMCxb8iM5ql2t5
         A9V0R4LYYfP1HsDkRkMATPeslXYGKX0tC+vYnOSEAIeKIavBkzrPV7I1Yq6OumdpwhbY
         NMHZt1v2aMFmTRXSuCb1nGX7GQpI7xX8Fz8hRYt4PgnwbKPkiXxgXIlxU2qzcH89/k5/
         lP6Q==
X-Gm-Message-State: AFq9FYJ7RAUFc2OBwGlQRk2h54ajUm4VSCTLrgDn4zwWec8b3GtynPnB
	v/tsww0bIZcBMsCuUpiqbc2rfDKo3z8Odtc4DbU+HnczozEenX/wtIiwKkK5m1tRftFbWPRAx4J
	uQuW+5YGhf/3bYz3JyGVj4Qzt32lkmCWR69GnplUcR9mAIaSa1SFJaLQ=
X-Gm-Gg: AYBFou3n0yJRvetTqtv3nrVOomoRv+O5oWODZ+5wWK+4p34D1iVcFToeYxK+g/LlADt
	TIsozlYhBcx0I/BXzHJaJAKVooUx/8DV7iuGdGYntr1hEoD5N3x4x/Ghcj2uw9fCpjR1P8M5xhZ
	7xdoqBNI6/LH5U4vPZGDbOcPHqVs/TzuSahb7qqvoa9TxgkrOcugUPilRXhwPLjzLJQdU178ByD
	M6c3BLsM2fdEHBi9q6eb+zjqe0onH7Sf9v6+tp8xDJRabOfJ37WWu0cXg3G0yeX9ucbjug8hgLV
	iQ9jhDrDjI+owMBT+eHiR3GMaDuAbYtwS8oHwhGGDrg5Ft3dh5wg2kK+e8RwBKyOrDyoVgy4sO/
	cCOAQBK1VJGZqzod143EW32AjKZnf
X-Received: by 2002:a17:903:1d1:b0:2dd:c053:ec75 with SMTP id d9443c01a7336-2e9a6e4378bmr56414865ad.40.1792386042510;
        Sun, 18 Oct 2026 22:00:42 -0700 (PDT)
X-Received: by 2002:a17:903:1d1:b0:2dd:c053:ec75 with SMTP id d9443c01a7336-2e9a6e4378bmr56414435ad.40.1792386041905;
        Sun, 18 Oct 2026 22:00:41 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e878910sm33730395ad.61.2026.10.18.22.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 22:00:41 -0700 (PDT)
Message-ID: <88085b6e-9de1-4056-9ae0-489cbd866601@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 10:30:36 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/7] regulator: qcom-pm8008: Add PM8010 mode support
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, lee@kernel.org
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-3-b395d2b3f668@oss.qualcomm.com>
 <sashiko-outbox-171156@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-171156@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAxOSBTYWx0ZWRfX1jE2RxMpMLIX
 y5rX77HfMU4qjADzmjmHfFWp5bNNaL6zCjkod3N//oGmVKgOMeMQtNsV2q3SGu0NsZVuouiXHNi
 Y3UhAe7/SgPaPdFjSWM6LMmqzP0AT+SA3lP3tVUeKMxnY2Qh8PEuGCcXcEuCTv0mZO1HvoZdfTX
 XPdu06pXkRKN77Yn7NNiSE4MIXHvhfiImoGsptAyV5pla6E70nm2YZ8PsXZkwTr4cjHc2uGrC5p
 gLqxe0uPwEyWOBCBx5l4h7DFfkfd2tJ9q8aVCzK10+Dmv4ZsAID7OKcVJyTCRwU6OPopqCjI5Nn
 o2wXGYYjp8oFvO7VmNm1xxxHXPJvZOEjOSi3CL5d8D+nLBMoTW1eDTq+33fguMXYoFptmnoXgQN
 C1MJwhH160/F38obHNSechP5OusleL2KSPCfswEdz+itVAaDNWL0vn2itew+MgYNcsLgaBF9pgJ
 C7bzDN6rdu1imA453ZA==
X-Proofpoint-GUID: 6YFGu41ZwzampefkpmpjXv2hpBCmOHBO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAxOSBTYWx0ZWRfX2kPn4dEljtOx
 ghNjUbc8xeqwU98BT8791awVLc3ASdg0pOHH7WEmB6kqLIdZya2AbdnPgz118e+Tl8k33fjbQfA
 P5v8+w4+u8WC8ZNzNNpLtM1w6cJNCso=
X-Proofpoint-ORIG-GUID: 6YFGu41ZwzampefkpmpjXv2hpBCmOHBO
X-Authority-Analysis: v=2.4 cv=Cowq4X4D c=1 sm=1 tr=0 ts=6ad5a3fb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=cRC-_68V1cTd_MlQ6vEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190019

On 10/14/2026 4:15 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] regulator: qcom-pm8008: get_mode() reads status instead of control reg
> --
> 

...

>> +static unsigned int pm8010_regulator_get_mode(struct regulator_dev *rdev)
>> +{
>> +	struct pm8008_regulator *preg = rdev_get_drvdata(rdev);
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	ret = regmap_read(preg->regmap, preg->base + LDO_STATUS1_REG, &val);
>> +	if (ret < 0)
>> +		return REGULATOR_MODE_INVALID;
>> +
>> +	return (val & MODE_STATE_MASK) == MODE_STATE_NPM ?
>> +		REGULATOR_MODE_NORMAL : REGULATOR_MODE_IDLE;
>> +}
> 
> [Severity: Medium]
> Does reading LDO_STATUS1_REG instead of the control register
> (LDO_MODE_CTL1_REG) here break the regulator core's set_mode optimization
> when the LDO is disabled?
> 
> When the LDO is disabled, the physical status register indicates an OFF state
> (evaluating to 0), which incorrectly falls through to return
> REGULATOR_MODE_IDLE.
> 
> If a consumer calls regulator_set_mode() with REGULATOR_MODE_IDLE while the
> regulator is disabled, the core compares the requested mode with the returned
> get_mode() value. Seeing a match, it skips writing the new mode to the control
> register. Later, when the regulator is enabled, it powers up using the stale
> mode in LDO_MODE_CTL1_REG (e.g., REGULATOR_MODE_NORMAL), completely ignoring
> the consumer's earlier REGULATOR_MODE_IDLE request.
> 
> Should pm8010_regulator_get_mode() read LDO_MODE_CTL1_REG instead to
> accurately reflect the configured state rather than the dynamic physical
> status?

Yes, this seems correct, will make this change in the next patch version.

Thanks.
Jishnu

> 

