Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60273AC0EC
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 11:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162774; cv=none; b=jhbg0WnguvBlEFKs+Elcx84N6LQZQraYOTZmoZyIooDgDx7th9bF3tdDrBdlPar9EoMYam0KTDZ7OPVodKzuzj1ZxA7FX/GDiDR6kH7PjrK6WzcuTGGmqhAJqr8nA325pFTuiJXZMatJRRqajrBobuNYL6zmhl6Oinx7Zc8oASo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162774; c=relaxed/simple;
	bh=1MCzPuhkOUx0yiCuhAWhyHvppbKmv7dz62NnFmmX68o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=COX5ghRlhTDY4z5RMKvlui5WGdtnV318dKAllnfYVfpc0aZZ8Pr2VVLV730tt1TneOYoc8g+oo8/KsRo/aCPo4SbA16QGBWrgwKh2jcuf7tZhprLBTegVSoBCgwYVySKS095e+vyZEF1w9VwuwH/P4zkAF8KKfio3nKWjoi8mfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HptVv/Mm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g99ppNl6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HptVv/Mm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g99ppNl6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2ljX3087130
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 11:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JqrKcvddEjNxdraXN5+nL8C9yc6R7w3YPVbh4Z3k6lY=; b=HptVv/MmzLlyy6aW
	SWMDsOq9FeecDMFcKgSUvkiXmdZx3LxUnhHOgkV9PLObA5OD5u7aoJc8DrK3qCGp
	1PZd2HLhj9W9950/cYWWaeekldN5+7tV/xRqyNHSVxa07Vcrxs5tCeXwty1fI8MM
	qBb+olSYXpK6Rm6Dh3qfs5mPrDJbNSZbKWSP4MTcDZ27d62mNpOHfUOhf3zEBFSy
	suqaTrw712vgO8ruwiI7BKyRR3PCCpdx4Xt1GwT0tquW9SGBxZH8ikKg8Py8yhD/
	2AGNTLQ2HwcMCnicaq7njhTS9g8R26O5h5z7Y9hoDUEQ7+/9tNtDiJU7bYt9ExS/
	HFBYaA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwm8hqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 11:26:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30f1b904861so1046390eec.0
        for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 04:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790162761; x=1790767561; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JqrKcvddEjNxdraXN5+nL8C9yc6R7w3YPVbh4Z3k6lY=;
        b=g99ppNl6NwwQMv8CkuALyWJpWLiOlA44JMCm/QzgtfyXeqNyAAsnp1fbx0Ulq74vxv
         ErQ1w9UTYlDgt0X55gOHMYTym3ljbP4U2Tyj4asqlm0x5yq9OSBQYZ9NR1p5i1WgxVnQ
         33gdEC6NCc/uHltmMBP/z/brq9JP8Q4TlOkVTOScU37xV9FU523+dK6lRG9OQiMiEeMa
         p1tnKZip33/Grbz/ytjjKL2F/rJfvjwt/K4SjCcN/aLt+WZOf0OXAUqnrp+Xzqoy7WX1
         90WDA7nxxrbC+PhwhF8Vo4R0EyTjY55c2wY4qAhw1CpveQkft2HxNvTXdyYv9j4iYHwj
         WXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162761; x=1790767561;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JqrKcvddEjNxdraXN5+nL8C9yc6R7w3YPVbh4Z3k6lY=;
        b=vVJV5QxuzjyJSIChq5dKFMNnezoHJ2v1pmbgw2CHa7rtj0ddDnLls4S+91XD/UpRTo
         BmtgUgWpgKhivyfH6TVwcP8w6Ovkl3pQuED+5b2Aw1XoX/u78oYOgJlGjR/lrMbvoBcT
         gAvRKmrJ9aqVOiG7K7vMZzFVbPC9gaaDtLfcdLJTM/6W3SuLYI3TsRDsY3n4bHJnsEZ+
         6IKsI5dRgjTme3oRcPALHt/x8yh/qMdPUh9vJQ7JxHLZZcT0/e6D+vbi1MSot/WGkCqC
         0teFOc654ug0FnrOcfBm/nit7+e7I+Tq/IcZ8fOt6a+O+vm3RCaEIlSetFY4N9kPHxzJ
         ytAg==
X-Forwarded-Encrypted: i=1; AKwUvBzQ0SvAnxaJEVAOUspfDZLL0dgP8qYMtyBRmoS5p0k0Wg0ravU9yP5zL25TaWn+FOo4mHU=@lists.linux.dev
X-Gm-Message-State: AFuF++lvJiAPXNwwIzFgo09q7oOI7RgC65tn4Nia9Xnbvdrc9xBdISu4
	o65mGeDHepZN6h5jQJJ8B6dDE8ka+3wHGKC2sR7HQOBM8rH5e/jNuHYnxQLZ47s9M/zWGW0Ffuj
	oqppKZz3/9g64yYhUEIZ0n83JkoESjdstQwHC5t+FLW9kXxxujpMedBo=
X-Gm-Gg: AYBFou2bVZaMN5zoARTg858VDLgax+bO2/CoQUExEaprtLra2mfFRIZiz90PImMsoks
	5VQQG8h++jHhslFHyhtq0v0k3TkhgGsqfVl+UUuBXKlCa4+FrvPS5lLi8G7vXcRO7CHtqteFSiT
	glzm+5k3oHD1/d5g28pVGd7rEWT23rBngih3Dnyab4ArQnpkzleYTCknjxl3vZb7PXghTljZzrd
	ftxO3kGTcE7XGSmUNifrvKU4SZzO6a7EAOfl1xmzA1+Ja6dcwyUE9f1SrzOgSUJUMVpH/a3utFg
	lfSkLsA8uT5VnOC6ueyyqLM7PJHFQXQOWva+Q+x2Uo9L0U39wUjKoM2RRSfqBgKwyYB+pAUpy+E
	p7g0TvyMjO0QxMch8wy7rGnfw1NhhwVc=
X-Received: by 2002:a05:7022:282:20b0:144:eab0:9cbc with SMTP id a92af1059eb24-144f9170182mr2757110c88.37.1790162761164;
        Wed, 23 Sep 2026 04:26:01 -0700 (PDT)
X-Received: by 2002:a05:7022:282:20b0:144:eab0:9cbc with SMTP id a92af1059eb24-144f9170182mr2757074c88.37.1790162760586;
        Wed, 23 Sep 2026 04:26:00 -0700 (PDT)
Received: from [10.218.9.75] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9877462sm5682402c88.10.2026.09.23.04.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:26:00 -0700 (PDT)
Message-ID: <c132d8a6-f845-44bd-b0c9-33b5a99f9759@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:55:46 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 04/10] firmware: psci: Add support for PSCI auxiliary
 devices
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-4-4aaf5c09b5c2@oss.qualcomm.com>
 <CAPx+jO_tDttD8+XpRjG6E+XyQa=-_v-Gr=2Unc+6OSBJ2P7Oqw@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAPx+jO_tDttD8+XpRjG6E+XyQa=-_v-Gr=2Unc+6OSBJ2P7Oqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfX8OyCXDL0C04z
 GaaK3+VtoRClg3nhpdDHIili+h1FpqgAoUH9ORpN7OZMSBRsKSuYRUpn0eUdOluRU+i1UFfPF5B
 g9QeeQ3L8QoHLlwl+foLH0ebzRJHdBs=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab3b749 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=2jq_lC5E59YAp211iCsA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: C_W1OiX4svRH7rND7p9fM7MJ0tPHeJkb
X-Proofpoint-ORIG-GUID: C_W1OiX4svRH7rND7p9fM7MJ0tPHeJkb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfX3CGmqg9SIYEI
 MJUKOMj6sw/4io1qK734EH+HSkTA+eW4ZvTgbTdFqlplVGYh1xQAgFDsxutNtPU8E+1LW5/LwFe
 Hi2X3G7j3wRygopPIXqZXJOLO2iN18eGtyGrmnCDk5VWtYWWjHtIbgIY+kBaOEprbkB+DgKS/D5
 CRSPNBuxazG/3VLWs0oMMrQxggct/YWxfabkNVjPCIhoRCWy3xVmRLLTsO0ezyR5Unx+fZSL6Hc
 hhfMaJGNY0dNQ/DFRUpg8x8Yoq6y+ZgO6La+kcLY3GkV1X1M0V7BPKeogKPJ9wbYqxNDejWsu35
 Er8wjWcdRyFXmRSkUlRjWzbZrFHobXQSPO1SkA31oI7Y6hgmhhgTc4SDBKTQN0iusy8B0+JojGn
 97eTgXHfsRj2XL4RYIXf5ky2X/sQeCBkqxUo33y1gqWZfUkk63OvG1EsI11eXFhjiDvHLKMvaur
 +Mt704Gq4qkocdisCYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230045



On 9/21/2026 8:36 PM, Ulf Hansson wrote:
>> +++ b/drivers/firmware/psci/psci-devices.c
>> @@ -0,0 +1,41 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/auxiliary_bus.h>
>> +#include <linux/init.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +
>> +static int arm_psci_probe(struct platform_device *pdev)
>> +{
>> +       struct auxiliary_device *auxdev;
>> +
>> +       auxdev = __devm_auxiliary_device_create(&pdev->dev, "arm-psci",
>> +                                               "psci-cpuidle-domain", NULL, 0);
>> +       if (!auxdev)
>> +               return -ENOMEM;
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct of_device_id arm_psci_of_match[] = {
>> +       { .compatible = "arm,psci-1.0" },
>> +       { }
>> +};
>> +
>> +static struct platform_driver arm_psci_driver = {
>> +       .probe = arm_psci_probe,
>> +       .driver = {
>> +               .name = "arm-psci",
>> +               .of_match_table = arm_psci_of_match,
>> +               .suppress_bind_attrs = true,
>> +       },
>> +};
>> +
>> +static int __init arm_psci_init(void)
>> +{
>> +       return platform_driver_register(&arm_psci_driver);
>> +}
>> +core_initcall(arm_psci_init);
> I think we should move this to arch_initcall().
> 
> To allow the platform driver to probe, the corresponding device node
> in DT needs to get populated, which happens at arch_initcall_sync().
> 
> That said, to be consistent, we should move the cpuidle-psci-domain.c
> from core_initcall to arch_initcall too.

Ack. Will update it to arch_initcall at both, cpuidle-psci-domain.c and 
here.

thanks,
Shivendra
