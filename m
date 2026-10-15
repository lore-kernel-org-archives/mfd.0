Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87436448399
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 12:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065889; cv=none; b=pe9v+rw9GCDNnRGgNZatKN9S1PXONkfCVGIxCR5aIKWFtDn1gzve1NLtFONn7hFhL76Dq25sbGNI2W1ufAlyobN8K72Mo9lwuSBGCdmBJ/wsVrQWjJMC+smlhqkWguH6IZ4611u858LTkH74nw2N+TmDxf6KLk2eRBInUU8Go1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065889; c=relaxed/simple;
	bh=AFxw+K7lzv7pYrWZ/G3VFcRCcPRi94Zq+V199RBe5fE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YCjTgS+QJMQQSkLgpaKTttXq8vKSTzmQ1B1NgcDyRy7AGH3AoDjSjQyPRVoc7w+XkAhBO73xJnNsZiwddxEeMCuBejAtZcNZZEkw6Bp1TU9lMmczR8qPm4cKbvt/BVEd4TaTsR3Fwygflxu/OSLCxJrRaPFNEZAPUdf3Gp2WQcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RdhsciG4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RblSe5LI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RdhsciG4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RblSe5LI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jRW02114210
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 12:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ySfCv8TU3dePxZNOzz5almNTjV7i8r2fPPb3Gn4l2cs=; b=RdhsciG4knO9l7ia
	jweiEwa03+Qzns6n8esY3/FnDnmrEWVztibX2tkDzrEbw/K7OBeqE153klWlGiDc
	RI8wjrxuMOp+xhmQTdmgJmHuGE2tGvM1mNRvJNlcvbsOOICL70yGcZJ3KrT0M32B
	hcz/vXbl5va1CsSLJ/9FbDMMhotYeDGZ9JbPZQMfA0gQYNGjP7BAoviczgeUf/ht
	wlmoxayeSjlgkzUTCZfUOGF1L/eEz2a9ai1ndStQjM/5XolR+iP4GQl+nBCBtbzr
	0qaxcf3vwamlFI+IFj2mGUPq/M2AWQgim34OtCQb2+Q8J0MHvJpk7rifmOuK/iEf
	E3GJAg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmyax67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 12:04:46 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5caeeb345c7so186839e0c.2
        for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 05:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792065886; x=1792670686; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ySfCv8TU3dePxZNOzz5almNTjV7i8r2fPPb3Gn4l2cs=;
        b=RblSe5LI2G0a8dI7D8UCxep6x0F+dczFIBvJichhCUIOM/QbvTiz1+Ye+QktXVSJDV
         cp99ahU9nRdlybZbvCbXLvtgj0NsWrIhsJoY8LLiAFp1BAsjtm7iAFyCThoRrNYgiTav
         jHikutIG5uZLv7ys4lEq7tOwXeXjZ0MjbHG163kcTr2QrORzMwd74Z0AZtyLEd+4Mf2Q
         Wx8UdKXhmoV899SDg9iTeeI/ZlxeBOy7lE3PO8SHWjBMTQ/7+QJB0uaxurZSSW6+Bsy4
         vcOUZEWs7mt+w46fQLeV3TLJpMA64i4nnBB6kOcYEKOm4qg8A8Em+PG391tTPQFrGXoJ
         4pHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065886; x=1792670686;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySfCv8TU3dePxZNOzz5almNTjV7i8r2fPPb3Gn4l2cs=;
        b=S6huWRCfazIFu1Sw9PVShby91lq1PAUm2nNWKW+W9IGIU0nkPeSTdtdvXV7x5M1XfR
         IbJlmLVz1TkZlTkZta4UxXERSa/2ZVR2gd2IqoB0aRRuNfpbcmOk50X0fyLmnfh7wdVO
         wOY6m4DFMpf75ipr2TDQeDw0t07/C+9vbvt5yvWDVL51QoiM+H9Fq2UVmaREpSINBcFt
         GMvpz92Ohn2BtbGs/ZsXGu7YBaKppTkSzTCulB4WhWMwQu5N8RBky7jkKMfl2A87FC5E
         yBxR2hsJN48je5vU4/hcVIgJ5wWciw3PWspkuDIU2M8TSDxQ7C5B5L/5hWW1gHAK0Wxf
         e5jg==
X-Forwarded-Encrypted: i=1; AKwUvByNcze8YV8RpJ0Z6peDAYTY7OirX9fCjR6f/TGs6rgKtxE53PoPkmRbAsYSqKjyljJPhBc=@lists.linux.dev
X-Gm-Message-State: AFq9FYIyHNEGKS36D9cdoIjXJFVF4NWjXQ1Iibk/qmI9vw4+0w8R2C2X
	qM++tWS3VJfXMgRxDP8kY7PWz8oLhrk0PnDZv1UCXbuF/N99cp64rhv2262F4A+VL0DjcsVq/mj
	6viWqZx01GDH1W93ajxfm+V57iOKuwDSlzBs4+MiQ1OpA8CoyA7NiDT4=
X-Gm-Gg: AYBFou1GNcVXWp4kK7vgWNfo9gjZQKUKNX6jPaA67X1KVRLoGA9TLfBxqnsx6yJihWc
	WVpNHEjG+zFPV2gtZBz86XcDvEJp25nlwN2owrrQ0ooKJkOKBOa80agvls0SfuC66v5KQ35Yd+t
	xGNZB8LiUTpBBkc8Fcnzb0Th+bYiwFJ4N7f2dT0yw7VMnHzVmb3kuDIMT4/dik2SARMadS31Opz
	BPt1LRmEctH+iZK4KgWwNRMESEMJ0LUGgprcxwMH45h++LWtvheI2au8W7VhwXkhGgHnCoAHuIB
	u3Ka9pfEnKwNMCiEX4Vmn3sxl/gpUlOckyCw3liefDyI3FomE1FokGKlEBOWu77LFHWafZ5XboR
	kHSWcNws5QrE4+wh7ccav/A==
X-Received: by 2002:a05:6122:a5c2:10b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5e91f242088mr3878483e0c.1.1792065885571;
        Thu, 15 Oct 2026 05:04:45 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c2:10b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5e91f242088mr3878461e0c.1.1792065885133;
        Thu, 15 Oct 2026 05:04:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda043b93sm115554566b.56.2026.10.15.05.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:04:43 -0700 (PDT)
Message-ID: <a940a7e4-95c1-4207-91d0-6aa5e715c2c7@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:04:40 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] mfd: qcom-pm8008: Add PM8010 support
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
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-5-b395d2b3f668@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-5-b395d2b3f668@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zMpF1aFbRDXm9BY1mr50hqjv5YquE9qz
X-Proofpoint-ORIG-GUID: zMpF1aFbRDXm9BY1mr50hqjv5YquE9qz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NyBTYWx0ZWRfX0Gqx7gyO+cpE
 JgG5sYkR3V22LBaJUntUZQvt5AI2RLYl9wMqIoAbFHEBkiG3Ux2RFZmwHsRRZPwNNOu6gdg8ZAy
 lxM/1uLcxtF/Edm3/SLyDP/B2Td1eoQ=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0c15e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=UejlFaKpO2bYa5uMUq4A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NyBTYWx0ZWRfX7HwlJva561SR
 g4EC9DeGybYKcX+3/ETo9H4nUZPVIHgiYzVn7W3d13eJ+7AqFCgOJLvCoS8lqf684RxUh9DRh32
 NazNmi/QHp76GTryIzdY1t15cXVY6ym1JWCxEvl4uiEFQ0iOSfFdKlR+9KWV0x/O77S/GBLXf5n
 qI3sHpzg2wPM9DdAnnSEpEP8b5DVc2oQwfAerSYX7DHuxQFkZE1Aoqv6L6YoE5xbUVOQh16Tnhz
 m9GCQ0VTUJtwqQfdWS+QhCvobYn+9jRryL/Uc3bUQ4T3ptMg/YZS5NUK/e5BppKFsxS6rUakdBU
 a2TZ8awOY/I0fu3rBoKaVR0o6Ad9oyUkyFUGHQ2DexqETf8bHGQMxg2lZB/KtGSvVlSty78k6ZK
 QxuqI379BIzsx6eufzoLoOzTlOWPBZ7hWf9qLcwXQPjkUgbPWip+dpWfJ2TjWSJvwktPy3XhBsN
 sksp45jGCudVpOHSIVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150047

On 10/14/26 12:32 PM, Jishnu Prakash wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> PM8010 is effectively the next generation of PM8008. The device is
> generally designed to serve the exact same function - power camera
> sensors and the associated supporting hardware.

[...]

> +	pmic_type = (unsigned long)of_device_get_match_data(dev);

I don't understand why you changed my match_data_struct approach
here just to reconstruct the same data

Konrad

> +
> +	switch (pmic_type) {
> +	case TYPE_PM8008:
> +		irq_chip_desc = &pm8008_irq_chip;
> +		mfd_cells = pm8008_cells;
> +		num_mfd_cells = ARRAY_SIZE(pm8008_cells);
> +		break;
> +	case TYPE_PM8010:
> +		irq_chip_desc = &pm8010_irq_chip;
> +		mfd_cells = pm8010_cells;
> +		num_mfd_cells = ARRAY_SIZE(pm8010_cells);
> +		break;
> +	default:
> +		dev_err(dev, "Unknown device type: %lu\n", pmic_type);
> +		return -EINVAL;
> +	}
> +
>  	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
>  	if (IS_ERR(dummy)) {
>  		ret = PTR_ERR(dummy);
> @@ -233,19 +293,20 @@ static int pm8008_probe(struct i2c_client *client)
>  		return ret;
>  
>  	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
> -				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
> +				IRQF_SHARED, 0, irq_chip_desc, &irq_data);
>  	if (ret) {
>  		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
>  		return ret;
>  	}
>  
> -	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
> -				ARRAY_SIZE(pm8008_cells), NULL, 0,
> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, mfd_cells,
> +				num_mfd_cells, NULL, 0,
>  				regmap_irq_get_domain(irq_data));
>  }
>  
>  static const struct of_device_id pm8008_match[] = {
> -	{ .compatible = "qcom,pm8008", },
> +	{ .compatible = "qcom,pm8008", .data = (void *)TYPE_PM8008, },
> +	{ .compatible = "qcom,pm8010-i2c", .data = (void *)TYPE_PM8010, },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, pm8008_match);
> 
