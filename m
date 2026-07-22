Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E3633374F
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 06:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784700574; cv=none; b=jZad50gcPYl1ZwMbvaD9W9Mq2mTV+FxQg1qAWBxs76YTH5PC+0Zmgo6hqLrsmWPZhpKO6MzfYPW4PKov8KnzHuGsYcHyzhpSctFUvp5Gzf0AGnpO9NAi4Eja4Nuau6WxTLEyAwXAi7se4lbn2kXe+qTak1SfMGzfKh0xI0ykIoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784700574; c=relaxed/simple;
	bh=R/cX8nhN8PUwkQfDndBPM/71jgFRBDk2eNytHU2iHDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pV5OEnzi7H2txYkN38WgD6199Exx2nNcNKuKY3XPzibdq9dqRPJvudVl28EUXOhp4BYjlJ20mlt4qgcZp5QstgdN5nO5u5LH/ZxtSVioXnbaxZAE5XwmLOA0SV3cyWMSMcHo5J/BmREuZL5+O2u+tv21qphFB8U6wxmaeHrMEZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JmaPVjun; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J7x8QTps; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JmaPVjun";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J7x8QTps"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53kjs3767770
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 06:09:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBDFrsbeu14tmNEHgR9Qu4YwB5hCVrBW3fi5kmCG9fw=; b=JmaPVjunahDpMya6
	LY7k4i/ADHQaAOeX20f5edq1wXbeVNSjbsXTHxdy2t4ogX21gZydeXuAF7c0jNul
	0FnI+7bHpwQh5wl6XGzzQ0kl4KEZMO3kqVxNgXVtbvsGJjZ99SEgEt1fg2M8sWHa
	xwPx/lMn3nOWhnqoYRBxwXkWBjMsi77AdfPd3pke57/8xqkR5m/2WViAexsCIwk1
	kJnIHIlWj9ftlL9rah+YN+o487fS6dNPEMr9UaYr2lrJ9XMrPQGsNBSceNvNKroz
	pIYDA9LqKcNSh4lGRKue2HDjMP/G5ktNozuOJ4doEBnTfRcgkDcwZrcF5FfZ7/Dp
	LK1wkQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4rhtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 06:09:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848568a6f62so20360951b3a.0
        for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 23:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784700572; x=1785305372; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBDFrsbeu14tmNEHgR9Qu4YwB5hCVrBW3fi5kmCG9fw=;
        b=J7x8QTpsYKZ436lj/oBX+kbuZvpE83E0PFBKXatosCT+CtwpUEYWM/NhtxviEO8dkI
         2oCMkRTx2mnmBOJP+qKkJEgoyxAx6DpmnvZ0GR80ZHZPDdv5HW/5bAdE5ZZ52ta/YWZT
         +3/QeIM4GzGgvznT3R/dMpttL12JYXQIvU63n56fLJOkRSHo2gyZn7odx2JQ/7wCo6G8
         it4JQUh5Kt3U5FdztvWJtOeteDkP/Da9adXe22kYtgLSdQMqSdBGQfLauUejyss0laLs
         S01UHc1tBRFdMgQiJMWN9j0lGabjKt/B2+1uz9rmQ6ya9X/Wwbi2OX0CpSma9zpmuBbN
         1K+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784700572; x=1785305372;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBDFrsbeu14tmNEHgR9Qu4YwB5hCVrBW3fi5kmCG9fw=;
        b=fzpixgfQXJoq1J9TSVLvdq1YZD50QzzfW7QXXzwgE1BRzLLNBll/pK6staGGGV/0AX
         HXBwxgTv7GXVEt9cBfNYFuKAnyyVp0Gku3zNmxKIR7jABGf25kN/T3DEKy32pzgF0a1J
         kaospsdLyacNnAmc9npju3TWXqagfvTSXAOxAJni0Vhf7oJHqki26gHn4hKAUdOLEE1n
         dH4p7ksuKlVrYhCPvdEaK/qMWhtbU9HgWT3c45k6Nn9FUIYxTQeWeU7ASdZee4XhR4+b
         ckQuuQUKzyml6Mk+P0GELHwVSsP+6g7pkr32FAA9R5FHOZ/FmVRTSgDaTkKnQtfdJ0Gr
         QXGg==
X-Forwarded-Encrypted: i=1; AHgh+RrjPI/HjV8C7EPDhZLyK5vx3HNLZEeCHsAGDubZ7x8AgJ7ViNG46jz4WrTtCNIFs1jQJDE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6q0YHfT13r1CXw15Y8uK2caoqy9uZz2DhYo+xYmZMgyILL1D6
	I7SCILOeB0UaS6zXQKIStObaPeHorCG6mB+U7ZUOuoHPJlcxSHG7ajgzb9mJaZRe+iwH6ebOAB6
	HpovzwiKLKPcQu59MU5ZUQGWe28PrnQQHBKFmcwwIoXy/UXh0HCtIeM4=
X-Gm-Gg: AR+sD128GBtpXXRqXBKNm68RtVeS7KQ6djuIbZwkt+HyJDGROYyCIcczEu6TGDZsNOe
	XylACILoD4OC2xoAsBvtk9m1+vlI69fdhg8D+Vg8yxMEm12tuaZqPSQQT3NghAIGCiD8NCs50xf
	JXharSvYma5JRxhL+cyrn84EjPvSk54t2YQdNCY6BQzr+vieV8GQutOPtu2McLgZmVTp3pZgCw6
	Sdo793GdFEnoQtIvcRsE7XGfofc467HU007APN94BRJYhkgfMrUeVqegB0hKDDfuI2EiF6Gm5m3
	fsZ3QQwN4gbF8ER5J6KY21ZUrAmBihlf5c2NeMD14TfTIdwoCXsjf0pMMnF9cQhBdQiVZpACJtX
	+BMLZW1Lnywa9TkeF1G9SyrrqtUCs2cPfTw==
X-Received: by 2002:a05:6a00:2302:b0:848:2f6e:e52b with SMTP id d2e1a72fcca58-84c2951315emr21779761b3a.63.1784700571942;
        Tue, 21 Jul 2026 23:09:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:2302:b0:848:2f6e:e52b with SMTP id d2e1a72fcca58-84c2951315emr21779726b3a.63.1784700571442;
        Tue, 21 Jul 2026 23:09:31 -0700 (PDT)
Received: from [10.218.44.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0ee1e6sm565937a12.12.2026.07.21.23.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 23:09:30 -0700 (PDT)
Message-ID: <25280ee4-b847-4206-93f9-9ed7b23f2275@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 11:39:17 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 01/13] power: reset: reboot-mode: Remove devres based
 allocations
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-1-e7453c548c21@oss.qualcomm.com>
 <ac030bd2-6b14-4b55-b277-422514da5f32@quicinc.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <ac030bd2-6b14-4b55-b277-422514da5f32@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RSaWwq8bY1sAVF8GMa4zurGZfh1fXx5M
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a605e9c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=LC1Hwnd0PhZBVGXlRGcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1NCBTYWx0ZWRfX7Q4wpDtQTvhA
 o3j2UUo9p1OzCdOpvT44tOZ75+SQrRvOeVOObQlNqQ2YprS2QkhbG/auDzGaCF65j140cJRWBGZ
 5yjypU9zXJvnMPOsYYeaok6QPA3YseuKwg9y3zKYyV35RWEXtBC7s7YKlQ+gR88BWflTI4Ir9ef
 jg7E52nMzZstHSfQNv94L2mmmDFA6bPA6R5WXW7SthAfGKsMUI6hmjjVxkgI9LAf9D6d16AaN+G
 wa+3yP9DKIa2TRIKQXvbIT0zi30xwPmFGoBgcOcAz5RwnygqZ93YhVmOBizf/IgjVwsAGFX53p1
 uGLaOabRVKjwVD0Q29fpdvhsVXmfHmb9ozHzuvSvOFWAiXyBLlIdYfP5NoWJ+yDCv1CscwRyvzF
 tIrm8DtrVrm2CO5LMU5wmi8hXQmpZJ9B9FanLmK05CJZL3FXABvnZST5y9PMarwTrFlYMz9RsRN
 UYnJ1vFWXwS8PXbva5g==
X-Proofpoint-ORIG-GUID: RSaWwq8bY1sAVF8GMa4zurGZfh1fXx5M
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1NCBTYWx0ZWRfXyaE0Ds7PqTll
 A0vkSWM2CIdwlMjWsSxvp5kPO2263rgfN2F5X4ijRMHd90v2BZkfFwC1A/FbWyK/em5w2ylMNmx
 EVGj5pMf1XAxxzuSumuVg3JgNZmP/IQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220054



On 21-07-2026 23:30, Pavan Kondeti wrote:
> On Tue, Jul 14, 2026 at 10:46:29PM +0530, Shivendra Pratap wrote:
>> Devres APIs are intended for use in drivers, where the managed lifetime
>> of resources is tied directly to the driver attach/detach cycle. In
>> shared subsystem code, there is no guarantee that the subsystem
>> functions will only be called after a driver has been attached, nor that
> 
> You mentioned driver may not be attached.
> 
> reboot_mode_register()->reboot_mode_create_device() is using
> `reboot->dev->driver->name` directly for creating the reboot class
> device?

Will review and re-word it? In current design, reboot-mode needs a 
device based registration and dev->driver->name is used as sysfs name.

> 
>> they will not be referenced after the managed resources have been
>> released during driver detach.
>>
>> To ensure correct lifetime handling, avoid using devres-based
>> allocations in the reboot-mode and explicitly handle allocation and
>> cleanup of resources.
>>
>> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/power/reset/reboot-mode.c | 32 ++++++++++++++++++++------------
>>   1 file changed, 20 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index d20e44db0532..7a74f72a8313 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
>> @@ -3,6 +3,8 @@
>>    * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
>>    */
>>   
>> +#define pr_fmt(fmt)	"reboot-mode: " fmt
>> +
>>   #include <linux/device.h>
>>   #include <linux/err.h>
>>   #include <linux/init.h>
>> @@ -10,6 +12,7 @@
>>   #include <linux/list.h>
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>> +#include <linux/property.h>
>>   #include <linux/reboot.h>
>>   #include <linux/reboot-mode.h>
>>   #include <linux/slab.h>
>> @@ -168,10 +171,11 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
>>    */
>>   int reboot_mode_register(struct reboot_mode_driver *reboot)
>>   {
>> -	struct mode_info *info;
>> +	struct mode_info *info = NULL;
>>   	struct property *prop;
>>   	struct device_node *np = reboot->dev->of_node;
>>   	size_t len = strlen(PREFIX);
>> +	u32 magic;
>>   	int ret;
>>   
>>   	INIT_LIST_HEAD(&reboot->head);
>> @@ -180,19 +184,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>>   		if (strncmp(prop->name, PREFIX, len))
>>   			continue;
>>   
>> -		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
>> +		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
>> +			pr_debug("reboot mode %s without magic number\n", prop->name);
> 
> Any reason for converting dev_xxx to pr_xxx here and below?

this seems a slip from old design, where driver dependency was removed 
and reboot-mode added fwnode based registration. Will update this.

> 
>> +			continue;
>> +		}
>> +
>> +		info = kzalloc(sizeof(*info), GFP_KERNEL);
> 
> The recent commits to this driver adopted kzalloc_obj().

will change it to kzalloc_obj().

thanks,
Shivendra
