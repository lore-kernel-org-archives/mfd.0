Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9343E7BA8
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 05:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792386065; cv=none; b=HieoTgK47N7Lwtt13yjRYAnwxKIYgzfXJjd2EjpA5NDPqdCIHTe0x3p66zxTHTpyvUIYKiW7nQl//n+kaTG8UE3CevgKV44eaJUcRUS3grhnQQDRwwwZAB7sgX5o4mwvd6oO66aL+D3l3V1YsMLZmSQN6NWX7LURmHlW5nbuMo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792386065; c=relaxed/simple;
	bh=fPc2czltw9PO/Xf3zDh+bJ2upY+FG2+DcJiTkmEwB3s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NsEvo9CUEVli9reWLPabp2yFglITQheepIr0XGFCTLaSSjBragylNdQ3yUA9W4tqp2EzPYWxrH7jsg9YJ7+2bGQNIYMCTESau3WEPZJXa6Mf39Qd3Wv31vqBQPVjwy5KUdRGHd5jROiqaehSaIL+/Ro4lVIg3UJzh+TvkZCJjzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BE5vuYZp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YLdKZ8/D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BE5vuYZp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YLdKZ8/D"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4ixXu1702209
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 05:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qL2Zs6vjc7Gn4trLCQtTm++ftscSxjKT6wlfuzXuyxs=; b=BE5vuYZp9+578OUg
	4olYecSTcy00I880W/6MPnF6PzX/655zaWMlJyBQQFMxptaZN0snb/CHv8dPbN5s
	vEE29SLXq9LAPO6h7cA2vN7hgOJs9vbpnYd6nGVwmYI0W0zSUg/xoI6qolcSWETv
	6Zr/toumtzKB9OJMW7sTq6m/rz7v8pdY+eva/WOu+T4GIuAIme1jBKeXFQbV0dAX
	P3loCcDg+THqw97DHVxa0aiOwoiocTi/zR9vf8bKIYxmmKvtuYmyrB6iBTVs4bDF
	GpRmRgyUex8ilZKAgjcgEwDW/2UFdgS1dNFo3q0GHWzhNH4ruf7jvP4AhJe6ZL5W
	rqOfKg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w18yn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 05:00:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e94f72fb9fso16189305ad.1
        for <mfd@lists.linux.dev>; Sun, 18 Oct 2026 22:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792386054; x=1792990854; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qL2Zs6vjc7Gn4trLCQtTm++ftscSxjKT6wlfuzXuyxs=;
        b=YLdKZ8/DCTadkF1nBm/kJUqybJofSnGzofalrH7PCmgYrq7kWbcI9+qpgIdHBuRONB
         RJaUBJplEISZVIPmmvSJfAHAZFUB+SMVTCiIQ+d5dgep5kvfG963ws7zPxC62mJSu/hB
         DBfj9pogHnfpSu2SRkoleckMwc0wVoOL4HOMHnz2H8yENMvB+IoHbuK7E/EUpXKUkzVh
         mGwRLxVQbRh5o+/5nLIyBAmYy0MaCO5kqbHMD22NGyqB44USDe1T8wsFlKYhHaoXNtMm
         qMPJHXlO6Jc8941b2NyesD/wHJxX4Ne+ebdJsT1KEKOai0S+k5kDyAB1GX7WKe+QDBmQ
         jtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792386054; x=1792990854;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qL2Zs6vjc7Gn4trLCQtTm++ftscSxjKT6wlfuzXuyxs=;
        b=OA4ri4TSsaJH2dcNQIXOTJfnGVp6NmOOo+NejH/L6wgW/jnnYObU+wK6isYodM7Pga
         Bm5D4P99UNU5t3+MLngrJg35WttozZYR+dz5/tz7PMiRpLsGdCrFqeL7lc0Aknqa8Wa1
         I2I8YmklDtu0qhFx3VmHyCT/iFmYeddpAzMA+2dIxCHqL8wKvS6AD5+/eoArhR9S8LBv
         17NNnrbYiqbs1Q5xT+2akjiDA4A2YF2T8o0SWjiHytJiSk8a4/w+jc8V5wiLWTFPpBUd
         EIOtqFggshZOAjvN+eIE9qpWrYAMYk7EpZzezLec7/ZPAX5WbGUPxRibbJLeuimvluiJ
         wRug==
X-Forwarded-Encrypted: i=1; AKwUvBzi2glovt/Zpg72sKUNEG9nk1MTCz/0V1tUVUVk13lUYcQQriOmnulZO2QC0yBmTiHcwG4=@lists.linux.dev
X-Gm-Message-State: AFq9FYIfGsO0R1cDvtwdF84/d/3B0e8qp2sgiVDq5fLV8mUpBFJon3Ak
	aVBSBu6lqY5Q6wg/MOv2hhBG6PWuFCsROf5dBDpPcjmMEHQzEHQpFUBauy+6nz6ciCGnGkxGQ8A
	CqLvuTCFNCLrkVMnFwU0Yo7UKi9JA390iZkWVHgILp2TEKlXXnIB1nfwDvzgfsa8=
X-Gm-Gg: AYBFou1m4jZlK7QjttLN8zCefrN1wZeqccOJ9hsw8ChE3WzeTC/k9DkGhje2/KaOFk/
	ynuKcTQbFMIEbjrPhNuczv0a79t1s9q9WEzwLsC6zWi5eBn/JaiHZGv8dsVsFp98bG5oiEKR+ot
	KJWo0IfbOXrynhHldOeAwZhdyTsmgoIouG/veaDEQi/0+qyMq+pRuoBpo84DRvwab8tIMISg38R
	mpWBnlWKgZtvVDvlw26OXo+K9ZB/KDm+njZ8SUOCWCK5nYlLwFG5DepNMs4z7QYKCXSvkcu+VPO
	A2UlhgD5kDT5Vk5LhKnmbsVw8hzFNpZUbRvn6CpNvBKSaiZ42ZV2GWQlpgkFzDQDP72fx9Gf/4j
	STMzo4l09zR/MWpUa/gPz78IpSBrK
X-Received: by 2002:a17:902:fc86:b0:2e9:5971:122 with SMTP id d9443c01a7336-2e9a69eaa37mr53344925ad.12.1792386054031;
        Sun, 18 Oct 2026 22:00:54 -0700 (PDT)
X-Received: by 2002:a17:902:fc86:b0:2e9:5971:122 with SMTP id d9443c01a7336-2e9a69eaa37mr53344695ad.12.1792386053460;
        Sun, 18 Oct 2026 22:00:53 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e878910sm33730395ad.61.2026.10.18.22.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 22:00:53 -0700 (PDT)
Message-ID: <6a5124bc-2191-4470-9d88-7d41bb6157ca@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 10:30:47 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/7] mfd: qcom-pm8008: Add PM8010 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lee Jones
 <lee@kernel.org>, Rob Herring <robh@kernel.org>,
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
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-5-b395d2b3f668@oss.qualcomm.com>
 <a940a7e4-95c1-4207-91d0-6aa5e715c2c7@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a940a7e4-95c1-4207-91d0-6aa5e715c2c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAxOSBTYWx0ZWRfX4jdb1uxx46VP
 4GHG0qABQ7/B1+97FlyhmrOhsNcGUrTiTW7aPjJWDeA1kuXhrANvZyR+BbRrWkjRLL4+sduVneU
 6HGcrnX2NMiV73q67Jq1f15xE7PQa0c=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad5a407 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8 a=_pPxPOlyeSa0pXYc5yYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAxOSBTYWx0ZWRfX2RO57x02Zbg+
 HrLzTZA2UGsQQVYiOF7iaUXeknQC0uCnQemjuhmR+Z4+htjB4YaUVByHVYTCerUAV1h4LO4AO9P
 rRTs6LdLn1Lr6zRbHVnlDAwG4Sp+IzngeQfYKGrNliCagyZKV8yp0MfSTh/NE54Zm0C/uL5Nim3
 aKX1Ph0icLLTv9ge8YWYcex0cJB4WpbKdfze+E0i56PBxnGVWnmL/XTrdWv+8wISlPBanS8Hvt0
 BiTsiKgv+FiNe2Dha4msPvfxAKBFVGFtwBIHlLD11185i/7qq/bhIr1Y8O74mWB6vgKbADFw7c0
 oipTqFxu2UQUtCBopv2apEokpGucqEOKCqkXGNFutKwZHaN3xOUMvwUqyJTPgQMgRRTt9sZut/B
 jg14+B/LIS+U6C3GIGQB7veZyUD+uQH0Q5g1tIMUz5wZsXXoqq3OWXu4Mjetzdzmj0WKWMjVA8C
 Fj6SC8CrCahZTcYAJEg==
X-Proofpoint-ORIG-GUID: -vcgEnUmdGV1d_rija2_eK2FOP8xgYQy
X-Proofpoint-GUID: -vcgEnUmdGV1d_rija2_eK2FOP8xgYQy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190019

Hi Konrad,

On 10/15/2026 5:34 PM, Konrad Dybcio wrote:
> On 10/14/26 12:32 PM, Jishnu Prakash wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> PM8010 is effectively the next generation of PM8008. The device is
>> generally designed to serve the exact same function - power camera
>> sensors and the associated supporting hardware.
> 
> [...]
> 
>> +	pmic_type = (unsigned long)of_device_get_match_data(dev);
> 
> I don't understand why you changed my match_data_struct approach
> here just to reconstruct the same data
> 

I was asked to do this by Lee here: https://lore.kernel.org/all/20260922093327.GA2308615@google.com/
and also by sashiko: https://lore.kernel.org/all/20260918165137.302631F000FF@smtp.kernel.org/.

Using an enum ID with switch() statement, instead of more complex
match_data structs, seems to be a convention to follow in MFD drivers.
For example, I could see the same being done in probes of
drivers/mfd/rohm-bd71828.c and drivers/mfd/max77620.c.

Thanks,
Jishnu

> Konrad
> 
>> +
>> +	switch (pmic_type) {
>> +	case TYPE_PM8008:
>> +		irq_chip_desc = &pm8008_irq_chip;
>> +		mfd_cells = pm8008_cells;
>> +		num_mfd_cells = ARRAY_SIZE(pm8008_cells);
>> +		break;
>> +	case TYPE_PM8010:
>> +		irq_chip_desc = &pm8010_irq_chip;
>> +		mfd_cells = pm8010_cells;
>> +		num_mfd_cells = ARRAY_SIZE(pm8010_cells);
>> +		break;
>> +	default:
>> +		dev_err(dev, "Unknown device type: %lu\n", pmic_type);
>> +		return -EINVAL;
>> +	}
>> +
>>  	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
>>  	if (IS_ERR(dummy)) {
>>  		ret = PTR_ERR(dummy);
>> @@ -233,19 +293,20 @@ static int pm8008_probe(struct i2c_client *client)
>>  		return ret;
>>  
>>  	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
>> -				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
>> +				IRQF_SHARED, 0, irq_chip_desc, &irq_data);
>>  	if (ret) {
>>  		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
>>  		return ret;
>>  	}
>>  
>> -	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
>> -				ARRAY_SIZE(pm8008_cells), NULL, 0,
>> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, mfd_cells,
>> +				num_mfd_cells, NULL, 0,
>>  				regmap_irq_get_domain(irq_data));
>>  }
>>  
>>  static const struct of_device_id pm8008_match[] = {
>> -	{ .compatible = "qcom,pm8008", },
>> +	{ .compatible = "qcom,pm8008", .data = (void *)TYPE_PM8008, },
>> +	{ .compatible = "qcom,pm8010-i2c", .data = (void *)TYPE_PM8010, },
>>  	{ },
>>  };
>>  MODULE_DEVICE_TABLE(of, pm8008_match);
>>

