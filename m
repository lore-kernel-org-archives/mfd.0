Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15FE2D5408
	for <mfd@lists.linux.dev>; Mon, 12 Oct 2026 11:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804560; cv=none; b=pL/WVdCeJuObZHnqzd9GSVQtX16Z87IbkqDr9SBucTuP6bzY2/hx02bqQN3jsi6Rxox4kBmTUVuDze+m0wi1LcOq5NjF9KtyYE0c7fsX/LwqbI7iTqrYwg9i///vsPqT9jd99Y8H1bKFh2lABe4WtvJ74NA1zQugoeKASRofTPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804560; c=relaxed/simple;
	bh=eCCFwv675o/3cQmMuraKwllZ+8HqmVG93dv6xF/q3dQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rjO2lE8RJZ0bsMlBWs5+B76YS4I4VJdQ7si6hyyW9m3Q8lCkC1nEVKgfgIET1ffLa7YBXKI+YV0ngJYJp+OMpw2GyTHOiXh9n3nDIPNjymUJoXq7HNb3ETb5RIroQBNCwwkRnLHbjGBdhPS7glb5D1CkgoAneRZXF9v/jSIYqIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SuTUJ9xw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OG1IOc1v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SuTUJ9xw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OG1IOc1v"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8cl6h955405
	for <mfd@lists.linux.dev>; Mon, 12 Oct 2026 11:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KpsSyBRpLE7chuyU/DR9kkm+ZGDrtuFOWjf4x27diA0=; b=SuTUJ9xwGk7IcNAv
	dEJ6RWOFNIaqV2gmADy/taq4Qgx3R8BkOMLs559hEkxg0b+SqZLN2wDv+guo7q+1
	Yw3JY6kitqz0EQ6nC1+5rl5F59syw8mGqsS9IVdNh1wsOHn1o5cvHhBzGD0JGVyP
	7YEkzj03uEl2s+kazlbXbizou9rxnD98LQbjZ4TtfqgNjPzr0YCv9UAeAAWj5UKS
	7wkjuLFh9InHteW8miF08ls9RZgHP66N1tO2nOhpq4IUyXiYoDI//brvg5f1g5kh
	ZuOQckQiEykNwZp/np+yMU9ooLscIX0hnpCtlQN0CYrBmsIypS+2bQZccwCCZRbk
	+0Y+OA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7kruga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 12 Oct 2026 11:29:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc19d8e59so11221785a.3
        for <mfd@lists.linux.dev>; Mon, 12 Oct 2026 04:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791804557; x=1792409357; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KpsSyBRpLE7chuyU/DR9kkm+ZGDrtuFOWjf4x27diA0=;
        b=OG1IOc1vCHhzNCeljjcHCP1Iw+7rC+mSW78Ti/h1O89DyndaFKQwR5b3gqFtqssNqj
         requm7ShdFp/ycp+Ir2rPG8eiSi3I6LYEoMTkv0U3EwGkFI1Dxr9uFmQ26/XnE5fokfF
         m1pIM7btJjQgGXiZyRFWLZLf8j9UIzDnk7YtV6Xy6AXkbmeedxphIADgxGs9l4MGt4aN
         H+5bir2PATJjkFgHbW6ui9v9WmTc6fQi/xwutg2q++38q7pUvJ1zL7yvRaKTaxHyTKvA
         u/tRxQqxDoK67IVg24+0REk4PUNi63cl+E+bZotlzZlYbrNabs1hfu0ZQHH3NaRcFgzA
         u64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791804557; x=1792409357;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KpsSyBRpLE7chuyU/DR9kkm+ZGDrtuFOWjf4x27diA0=;
        b=XVpcNtq8UGdH4BW7agbMTwo1nw4kU8Yrr3AJ0jJaceTVrOBTNDIbViJ/i3pQI33Md/
         j4dPtM/u9RSpn7LeG8Q1f8ncF8YE9Kf1WcnDEGvHe7DjZcv/l21dZAZpho943ENtl4NS
         zBjhVJq4BPjcFGYWRNEZC+4zrhNro9Q2ZXNflRmLwlZLU50ZJigotDdbsRPQRbLHnJD6
         b8Li8ah5K8l37AjHYrlVVk2ZYaBS4HfG3ctkdhWv2hkVeocwPH0gmEYMwqisRkiH7MnP
         9mAVLbG2poP05G+Qr/jt1v8rc2Gm4z+80KXcaQU5qMlj2Fn1gtWRs2hm8BolRcC6fl8q
         wlcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeGSaqquX5lg3RFgiKVEoReDi5zpOv6jBjduwRIsluBiKHakpGxfnRzGgotxLTZXcrOrw=@lists.linux.dev
X-Gm-Message-State: AFq9FYKZmE6nWyK/zgw26JA4EMZqEKlMwyV8jwwwF1hMXcitDVfgQeEz
	wo5S1gxVLOJGFisdwZYWeMi+xbkZgHS4a9EYDB34dgWnoorLToUm11mYWKXxX3Z9ZNq8+x1AWQa
	J4StJeTpUO54lrx/pCQRxIGXW7vzAZ58rt2qT5c9pMKyfm9Th0kj8f9o=
X-Gm-Gg: AYBFou3Zw4n4iYDdMA0YuY/ZSQBFh1fBIFJrkY6msKjstIFSVnUmkixAZy4ekvpyloK
	+mLCY7xi0emyJhLGqotZuSws5kzFmRu6dDsnIlpjv+0C8Z6BvzLiGcB/JDJ7IvRgd3XXQOgM409
	GQlHPdjNU5EAmxhz+3OcOcA11U7Qi5EYBQH5K22n4Ly9Ts3s5ZalLTQm4hDupwLQHUKZiLSfqAU
	2RQVle/g+GGv+vzdkCYB4q24nzlTM+rMEsxUX/6pPYoiQscP4A9Vk64rEs0uJg/dC/5uonXQ3tN
	JaVCrBNRV0wpZdryfesXuMS4aPESt47c3Qv/FJagLjpr6icW4E7na8jzOUU4Kvax8pAGym3pLJn
	1J9dmSryVx9MmAgIhqIhFIQ==
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr1713164185a.3.1791804557028;
        Mon, 12 Oct 2026 04:29:17 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr1713160085a.3.1791804556519;
        Mon, 12 Oct 2026 04:29:16 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179e01101sm4750943a12.35.2026.10.12.04.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 04:29:15 -0700 (PDT)
Message-ID: <b7bc5c82-6812-4df6-9820-122a4c957036@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 13:29:13 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] hwmon: Add Qualcomm PMIC BCL driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0NSBTYWx0ZWRfXzP7D3QHf3q4f
 IXuQZCREFatx/dK8mcXH7c4pQpueXCHxZItMhXw3qeWSbUV1Uk7XOdX5pONpxSm6sS6j3tcgOWK
 g5h4toGKgM8eUK3T1cVxvimb+YEaIdkNBVxn79CGipcKkyTVZhaISTqfbC0y7mp7CFjWeYdmIYt
 F1+Q+E1e8iiRHI8/VuZojrfunx19dPr/p8SQiyx5CQgX4WxqGjiNlVOM6m4z1zREaPlE8C6T5uJ
 IvAmYHTYFg7KokP7WTcBw2/Sh6G55GHBBrlmUxO17WyhiyZKZJrLSBhaBLU5HWE457mxF3TDU9n
 720QBNz6Z7jl3kzZtkwrS33HMdaHGOABwCNQU51M3+kTnq6qFmae9UNthE44ELugdtaREDgiFNK
 tuGYAXnlZ++wQMWf5N4hFM6hsMKLXAECqV1aSj8yhjnecvKTEK6C4HG5yQgalkeDWK83H3OwvvT
 jOWPFPNQQHanmIY5chg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0NSBTYWx0ZWRfXxfN4+hVA5Iff
 9FuQwuWDnqnOs7r5v0a18b7vBSnuUjaLBOom9RAfDtdOdykFZRdgJQ9FiAnOctzfO8ku+hGE2NX
 Db2lMArD1aeTAozp/2bj9ZY6y9gVXyQ=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6accc48e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=OrLOohl1hFq0FUu3FHgA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: GM9FjhhTY4pomF_cGTUTAbo12LOrIoPU
X-Proofpoint-ORIG-GUID: GM9FjhhTY4pomF_cGTUTAbo12LOrIoPU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120045

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add driver for Qualcomm SPMI PMIC Battery Current Limiting (BCL)
> hardware monitor. The driver exposes battery voltage and current
> monitoring through hwmon interface.

[...]

> +static int bcl_in_thresh_write(struct bcl_device *bcl, long value, enum bcl_limit_alarm lvl)
> +{

[...]

> +static int bcl_curr_thresh_write(struct bcl_device *bcl, long value, enum bcl_limit_alarm lvl)

these two and bcl_in/curr_thresh_read can be unified, then some
helpers can be collapsed inline as they become single-use

[...]

> +static unsigned int bcl_get_version_major(const struct bcl_device *bcl)
> +{
> +	u32 raw_val = 0;
> +
> +	regmap_field_read(bcl->fields[F_V_MAJOR], &raw_val);
> +
> +	return raw_val;
> +}

This is single-use and trivial, inline it into the call site

> +
> +static unsigned int bcl_get_version_minor(const struct bcl_device *bcl)
> +{
> +	u32 raw_val = 0;
> +
> +	regmap_field_read(bcl->fields[F_V_MINOR], &raw_val);
> +
> +	return raw_val;
> +}

Likewise

[...]

> +static int bcl_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long val)

Do we expect userland to program these, or are the default limits
sensible?

[...]

> +	/*
> +	 * Map register value to battery configuration.
> +	 * As per hardware documentation:
> +	 * 0 -> 2S, 1 -> 3S, 2 -> 4S (unsupported)

Would it be hard to support?

[...]

> +	/* Check if battery detection is supported */
> +	if (desc->battery_config_field.reg == 0) {

This is slightly sketchy, but SPMI peripherals always have some ID
registers at address zero, so okay..

[...]

> +static const struct of_device_id bcl_match[] = {
> +	{
> +		.compatible = "qcom,pm7250b-bcl",
> +		.data = &pm7250b_data,
> +	}, {
> +		.compatible = "qcom,pm7550-bcl",
> +		.data = &pm8550_data,

Are they exactly identical? If so, please use a fallback compatible

Konrad
