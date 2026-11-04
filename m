Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795182;
	b=Gvr94XO5JKtY6ZBMI7m+871PtuEI3sJ3TLZPesScj4p8ImAQAMqn1tjo0HVOcBBLojTj
	 QQnGHPE4L1MVXvS6HqTMw16nxcx5cU01MnPdUZyIbFqANRII0dfzeqFTwk97IXcI6NU7j
	 1/f0xfpjvqOgDXR+WOnI6cFjLB7msqBZXzKwH//SzAy16cwuLJt5TKWsB9pZN6jRI1FbO
	 cp9dnPmt1ienjtuSmmH/sexedSkFv3OzmC0IbaPIIK1N736iZNaeavaz/F7hDymFCWqK5
	 Tc29quTaT/Rj9dau38AK4tTDgM3Qj/pqYwjzcXFdAE7ZQl0vo9ZP0sb7+/llAHZooYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795182;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VK2mF29MPTHHe+f3apHM/eGxl2KHbCALcUXSoRbY3qE=;
	b=jyLxcFXjKxGommn3Emu6SRkNiaSlNua5IctmXJGHiAmyXBhidQDpTVFRz3+2y7QYA0wA
	 yFHdPvHPf94DcCJKg1lLPuoIHvnh+VAbz1ayHd97qofFzdLbUXE5FyjXJ6vgX1n2JuLgs
	 +syGs2iRfP2NnndaTldRKYj+pQm6f2oYUoLENGgEovllTquWZMgfHSuSqPcbHG5YThbVY
	 2ME5mfZ+pNNuwi1cmMQgJGD10kntFkyyjUAa5Y4ECrTtWTpa7pd3EDx6MkTX69YuVgysL
	 Kkiu4xbwu9PJr1yxqbAxAx9a67m9caotKQvY/qh1kR8Q3GusUtCojF+07tceDyhWEBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fx+t21J6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=giKXHMd4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F107E606A32C
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 12:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F107E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fx+t21J6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=giKXHMd4
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZrXF1700251
	for <mfd@lists.linux.dev>; Wed, 4 Nov 2026 12:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VK2mF29MPTHHe+f3apHM/eGxl2KHbCALcUXSoRbY3qE=; b=Fx+t21J6rHyUMJMb
	GZNednuJA+XbxTEdcMhD+WABGRodwzN8hXZt7g4lHDsSYSKoEglW8g24cxWZcFug
	nVcgFlz7tvADFxgvXDFICY8tiEQyZwnmoDYt8l3NIDRGearB/MJ/12xRTojwXS8R
	jDIh/wYZGnKeY5sr4BKV2/sEalWuUmjWJV2aaLo0jMtZUBOKYkaBy9ky6caOb0g3
	mtDIDX/csZvbhvSnG3ZILY8FxI/X1gsn6LhTpMZdKecop0qGxm/pAABNNzxnIfUE
	f/wg8FBCbYnzLV4tEkfw02jzmwq8l3DRA0USuwTQ5Cnf1UQmqUspE2koHjjUbvfp
	M7jCNQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3pyg8an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 12:26:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso966904a91.2
        for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 04:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793795180; x=1794399980; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VK2mF29MPTHHe+f3apHM/eGxl2KHbCALcUXSoRbY3qE=;
        b=giKXHMd4yx2lAunxtkx4FFwMT4a8CvrC8WIgnZ7rHKIxFtG8XdvldNfLffe+OqMhyw
         fheUkkfss5n9SLUNw0lj4rXSTw4JW53eSPJpnJ/3COhtCykQgUj5+WOg/ZziD+udArPo
         Vk51cQv1pWi6LibZ81Sxp9Lcq7wMvDMg0cEowkzm7V3XZJL+GxQe4x3TbTTNKpwXIdx0
         iXuvb8L3D98HqrxfQiJmYhbYeoRHYlYiz40uCrx0sSX1nihphOo+Dpov4JqIh+evWP1K
         UvdePrxUGgKMCYzO0Q+4OEfW+PKHl2hAmxB/9lOE66+bwo/RvJLAvX7lWe1T9nB49Oul
         FNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795180; x=1794399980;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VK2mF29MPTHHe+f3apHM/eGxl2KHbCALcUXSoRbY3qE=;
        b=BgOeCbtisy7BIXFvZKViXst6YBiJNWdBsrSasKo+C614GazOAmsrqUTVeBEHwRf3jR
         OsPGbSNhhTbDygVzDro20vY8icIU6JNuFSUPY1BIJdEJiHoNdIv18tOKvJwfayoxehMF
         7DnnbvLqGaZ2m/ZNBfNpbJAqVtmOUODGE/QNNPp2en3+Tm/qONaNYfYVLoiaiq8H23kn
         8hMcbHNwToQmOcI/z3dBFNQgQdQr5ZhNu+y6zQ2KlhD17rjD2yh+WNlJ665wf/5rlvYM
         80UtCae8qsfseG1SQCycxgpmbG+Sb7vvy4pERzmZFxZ1f8K7BXyNMTme1t0rCdXB4KW8
         MWPg==
X-Forwarded-Encrypted: i=1; AKwUvBxcwxzs0+xSzuv6MmMQaIuBsFpKGYpymuEuohAEOD3rR3qkcs8CJl9jzx8zoiyENpqSAOI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8o8ieMQlEVyifMGmlcyK+i77jTmJfJM4t8i1q8CfHTVpaUDm+X
	728+CuKGLZB9e5TiUiHerYL+Cj950rYt+Mxpzsr7b8voJ918pw2aYqBYOOeEXvokFIkx1BmMF1x
	O7EMq7BgXQM7RW2Q+DSIPcFDt5UMLaU7gHTuAyHa4SwggehR5XHdQIXI=
X-Gm-Gg: AYBFou0ajr3H+kGkPt6kvItNy81W8jxdV3aVPNbRPS7uDt8CXPWv7liqtQzqR4jmSRb
	18a9hjOwMUK3LBt/72ykzeYG+XqJJLW7WaMlXQmNgXgpfizl/zA5TSipbNedgM+UNDqo8UdE6Wc
	tXuSmir3s3Vw1LDjCl/EGLxMdam7mjM+FjRsqPhC4+O9vyFFrzPC1jd6indNPxUrhnax8XnjBWL
	xhVyJ/rzWVa4KU6wRny25g22/wC0DOu4fQSSmvwhBKZ5lmugpMLgTW3uwPwF4LBOWvHGdx0+UMf
	OcQ8ICW+cUA3hGgz0ZO/kgq8gwwYZblbRgJXXirLSD3bCMzrqEzV6NMKQtD9bhbdB0Y8pe5mQNR
	Gc7MUQFRt/W2vyVH4AQPRCoosn/BnRQOj+JPlksmT8aJA6eY0719o6vc0ZsWWpKRk4wIBrpx5Df
	3+w2wVaA==
X-Received: by 2002:a17:90b:53ce:b0:3ac:7c52:fae5 with SMTP id 98e67ed59e1d1-3ae89835706mr12958240a91.50.1793795179559;
        Wed, 04 Nov 2026 04:26:19 -0800 (PST)
X-Received: by 2002:a17:90b:53ce:b0:3ac:7c52:fae5 with SMTP id 98e67ed59e1d1-3ae89835706mr12958197a91.50.1793795178953;
        Wed, 04 Nov 2026 04:26:18 -0800 (PST)
Received: from [10.92.198.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b093d481a3sm3924074a91.1.2026.11.04.04.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:26:17 -0800 (PST)
Message-ID: <f51b9be2-acbe-4d4f-9f81-bf5b289eab0c@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 17:56:07 +0530
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
Subject: Re: [PATCH v4 02/12] hwmon: Add Qualcomm PMIC BCL driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <b7bc5c82-6812-4df6-9820-122a4c957036@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <b7bc5c82-6812-4df6-9820-122a4c957036@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZbmIpcVA c=1 sm=1 tr=0 ts=6aeb246c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=6zRx56OMOPonLltcXX4A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX3Of/DH6lh71B
 PhuvkaJmTJp5e01okQbgPfGuWfpBhOY6JvU0RRU/cqnFMSM+K1+pLAG9Kl4p/RoefyWosTez8IR
 4tNHGqEF7aaR1NfNVhcvXKM9pTStHICjOxHuOlS0uIiv11wir6pVLv93b5mbOHJiqIZz2RZApRf
 s87wmpg4U0fupQqhjzaCii0UfQhPeJD+oG3dGQnSwmJr0yboWdHK0XFUQhFbpfvmO/TXNYUC0Xa
 za0kAe8iSh62oMHGK2EbTCQMDWS1Nh1/9Q6SN+mj8w1LITm1+oU7SGQfY5cRliC+TpC0OlIOf5d
 1HA8UMbheU6j29fkppE6Wfn9Km65GRwXVN2DrKVliygXpFfnAeFxMaTVaP8OG5k2p53xUxo5C2o
 wqOnLsXQV6s3TJ5oJtcMPcvidFYL3TO6zIYaTA9qJFXGNTw8JbeYAQRp7rkzxfgoZd3ycewhfg8
 FJKLbvukUpUF641ptng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX6qCydKA0k45H
 Qh4stkJsU3XVNeY9uqhgb/kFLaidZSE4bmGIy86femFJMO8sowi//OSmKilM7Cp2lOR9XPRHruc
 lys6tBpFOiZ9ilwtF9183MEjxZ1R9ho=
X-Proofpoint-ORIG-GUID: dvx55nKi2c9ZUg8tOOqzNilkAdsbLUmc
X-Proofpoint-GUID: dvx55nKi2c9ZUg8tOOqzNilkAdsbLUmc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040049

Hi Konrad,


On 10/12/2026 4:59 PM, Konrad Dybcio wrote:
> On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Add driver for Qualcomm SPMI PMIC Battery Current Limiting (BCL)
>> hardware monitor. The driver exposes battery voltage and current
>> monitoring through hwmon interface.
> 
> [...]
> 
>> +static int bcl_in_thresh_write(struct bcl_device *bcl, long value, enum bcl_limit_alarm lvl)
>> +{
> 
> [...]
> 
>> +static int bcl_curr_thresh_write(struct bcl_device *bcl, long value, enum bcl_limit_alarm lvl)
> 
> these two and bcl_in/curr_thresh_read can be unified, then some
> helpers can be collapsed inline as they become single-use

ACK

> 
> [...]
> 
>> +static unsigned int bcl_get_version_major(const struct bcl_device *bcl)
>> +{
>> +	u32 raw_val = 0;
>> +
>> +	regmap_field_read(bcl->fields[F_V_MAJOR], &raw_val);
>> +
>> +	return raw_val;
>> +}
> 
> This is single-use and trivial, inline it into the call site

ACK

> 
>> +
>> +static unsigned int bcl_get_version_minor(const struct bcl_device *bcl)
>> +{
>> +	u32 raw_val = 0;
>> +
>> +	regmap_field_read(bcl->fields[F_V_MINOR], &raw_val);
>> +
>> +	return raw_val;
>> +}
> 
> Likewise

ACK

> 
> [...]
> 
>> +static int bcl_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>> +			   u32 attr, int channel, long val)
> 
> Do we expect userland to program these, or are the default limits
> sensible?

There are some usecases where userspace needs to modify these settings
like in different ambient condition.


> 
> [...]
> 
>> +	/*
>> +	 * Map register value to battery configuration.
>> +	 * As per hardware documentation:
>> +	 * 0 -> 2S, 1 -> 3S, 2 -> 4S (unsupported)
> 
> Would it be hard to support?

As per hardware description, upto 3S is enabled, will remove 4S part 
from documentation.

> 
> [...]
> 
>> +	/* Check if battery detection is supported */
>> +	if (desc->battery_config_field.reg == 0) {
> 
> This is slightly sketchy, but SPMI peripherals always have some ID
> registers at address zero, so okay..
> 
> [...]
> 
>> +static const struct of_device_id bcl_match[] = {
>> +	{
>> +		.compatible = "qcom,pm7250b-bcl",
>> +		.data = &pm7250b_data,
>> +	}, {
>> +		.compatible = "qcom,pm7550-bcl",
>> +		.data = &pm8550_data,
> 
> Are they exactly identical? If so, please use a fallback compatible

ACK

Thanks,
Manaf

> 
> Konrad

