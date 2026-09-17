Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED924E2F35
	for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 12:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648241; cv=none; b=LCE3S1Z+gidJzhQj00dV4Yr5GKChlfSaDdgORQ0mIwNOn2dkUstIcUd5TO1d0dKligbWmumHduQ+zFND/V7Al4ldAXRNjya0w6PbAnzpHiSoL3HNDvO6ujC9QDSxoZolqKxJF3nH6sgEYgYg6+h+wOh3DfAT/5ElFk7VMgHIQes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648241; c=relaxed/simple;
	bh=IrEZVxtAcGTWTQmjcP4fBFtJejLljjOJ0I0fPBSWZMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MGYTf6FDyzjg+nGT/lv+McbTJXV9yLR2Uw5rh5/G1fszEG+81s46tsTRMxHgBcQL3UYtDPGIKtwIA40Y1zV2Na0BZvyN9EtbCQzHuAzJ6QwIzgxIKkXpZkLpZSsJ6e6e3rT0qiKHfo2R9yO7DD0NLCO/ALHvbBOtGj9WpnIsG3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRuDG0nf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YGqdrvNQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRuDG0nf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YGqdrvNQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZVxO2410426
	for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 12:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4q8gvMIQDTw2ylw7lWi4SL0F8ENS62IvhhPOrledFr8=; b=jRuDG0nfCRc8tTIE
	2ZwZFAIVF6SWkB2EYW2iUY7deRCRkNNw790SGV3yu5Q6vDwbfkL2hUbvxuL+h6p8
	YQd89hGJZxcVnQXwMjC6XBZ7WCojS9/S1sjQA4jEx4lfY7aELArzv4cnNqduxJr9
	zgvhsYAOnro9uxHBtfmncT6flZg+JUs9AXw7Y6R6M6wD8Lrjvi09JEW8TxXU9jYQ
	/RFuHB/baJaHPJhil75ntjtmdoMK4Ho4DdJ9H9QFST9ZOJ5zjRq7mrb5WBUXgD5Y
	Q+FeYVlS9WdoUpptZAezyp5ZC1CF/LN9Sf07UuGv1ymEOjDZ8L0iQz/N3ox/kOJl
	2U8d+g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6gr88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 12:30:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso1539386a91.0
        for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 05:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789648219; x=1790253019; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4q8gvMIQDTw2ylw7lWi4SL0F8ENS62IvhhPOrledFr8=;
        b=YGqdrvNQmXId2FN3kKvL5YFzwziC9Md7VEvedt78eqtNDoRD1bA+No9ekVXZbnwZ8N
         Jr4cMXWmdODe5AIrTRtCZOEoYCnGQOlp8b9+FZUMw7FVJ1xmZ+pEM5mYqtoSUazfLoEe
         tHCJRM9jaCcXAFvvlct+cbJRkE5RXDFCMoMgirW82eHgq1HzOZhvWraxNvbhbi4SzuRh
         Kj1wxyCiYDZZ7YPSSn5+KtYWuRLkGsyKG24lCLZ+rC01c+YPdf9EJMz5xbwLUReSyePI
         0axxI/gn1/GpaP3O7Uee/WIiG9sEXs6UAXvPMVOHDrUgoahOnBEVs45AXHpDa4X7dCDG
         NjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648219; x=1790253019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4q8gvMIQDTw2ylw7lWi4SL0F8ENS62IvhhPOrledFr8=;
        b=EqkBjjT8xfiFuaGapYZ7lFcS7kvxdymCVWa68hXNeT7ls56jge00mcHAHQGWkpNlkI
         x4KURqq5GTRBADHJKkkSF0s21WBsf99rgNXftKphI043R7/hSHC030Bc33ID5Q49+X6S
         fk9C2sA6MtOD4duGouJ1gq0l7OtO+Ogo9h5ggmDT1T4TTu/YD2OySTcB657gZhFbfx5S
         Fmp9pcRtjA0vJ2yDNApULRvH8NpN6cho3/LK1+W/BWjM2EFxecOnfg2AmK0+M3+5+vFg
         QqKdkrwMbbi0Zxb+aYjEfzJiSKVp9kifmK+/PzK3MsuHe6t293jOLCWXK7G5QRAYpjwQ
         42Aw==
X-Forwarded-Encrypted: i=1; AKwUvBwmjGGMZmmTibb8U/myJGhcHK1MD80Gj1To9hdqk9EbV2ffVnDzlr52QVYCU/HPAVJzwzc=@lists.linux.dev
X-Gm-Message-State: AFuF++nahrZJjUOyFRzc2yBdFOGSKj3kNLj1iBqsP05+8lUtzpuE1l6T
	8wlmy5wE5HXc5HoVKErcTBGX0+bCHCTydDxBA7o+XsagdQHFouucq9/dgbUg2+DjrStnbCBSXC0
	WyWRKEXDSLFL0+BnVmx3iAdwBgQzV7fglXpPrfTsr860WpTTElt+aw5Q=
X-Gm-Gg: AYBFou1AxmHi/YqJh0+q7h9WXoAd6R+mxK9QyA//k5cuVC7OKWnpqGr9JEOsFySe0U5
	EeV5tmjhD4NfX4p3/LEHlKCCD+VM6xQTKNW0RL6V+pFKCcjbmNSsTIi1H2TD80MjyLommRf8Ukf
	wlVYG3OqwfVdudizrhGTXekPQIMImRb4GlENGIGSSKaPeD8APbrM/evEII3A/y2TMPW56D7c8qc
	7YbujCnsTgNQgqA4rdUvw3h1ckRPxXK1ESPo6oBjsDDL4BNcPiix7HcSNh3zNOWUNH4hbP6Msqk
	Y/b9DzLDxP/3kyTpnaprJ9hIeHuXXyeTv56220CbxrtzvGiAG1Ue8XguI8O7pYi0HgHkKMp48bu
	Tz7PlWAp/tUAr+a8cDRVJKiyehicQu8o=
X-Received: by 2002:a17:90b:2688:b0:39e:1c2c:1d4b with SMTP id 98e67ed59e1d1-39e1e31d67cmr16479163a91.11.1789648218565;
        Thu, 17 Sep 2026 05:30:18 -0700 (PDT)
X-Received: by 2002:a17:90b:2688:b0:39e:1c2c:1d4b with SMTP id 98e67ed59e1d1-39e1e31d67cmr16479034a91.11.1789648217991;
        Thu, 17 Sep 2026 05:30:17 -0700 (PDT)
Received: from [10.218.9.75] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e361b7266sm5054768a91.13.2026.09.17.05.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:30:17 -0700 (PDT)
Message-ID: <14caa8e3-63ba-4a22-b95a-f7bc41ded545@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 18:00:05 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 06/10] power: reset: Add psci-reboot-mode driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
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
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
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
        Abel Vesa <abelvesa@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-6-4aaf5c09b5c2@oss.qualcomm.com>
 <CAMRc=MdpuRhbCXZd1xkRH4Rs4g=iGRa1oaeN6vcmP3CjcJpydA@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdpuRhbCXZd1xkRH4Rs4g=iGRa1oaeN6vcmP3CjcJpydA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: t44K0n2JIhf3t6G3CA2dm3HDwxZAEwZk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NSBTYWx0ZWRfX7aaO6DWGajie
 Ms4ikFbxLwFdKcB/c9lPD1ri5TDZrg5PAicauKgnjkgshIIBmtl6bpOcAHxN6pMxEfuhL3bfGuh
 XMtIKaWdI2iIEnq0Yag5MlU3OCgWFlL8jkyTf7eriraGInEugJ7LQ8hxu7bKs/paljJ8TuE9wKH
 TxYUwJbUPyWGpPICIUvDN/BsMpC2WHZnAuMzfXQ28bOCZ/SiswrS0Eg3PN3YiopJuqNxD/ZnIhD
 qB0Gj1OhvwVPnfWq/plnFM8BV1liLMHN8lwsB9NA9GfLqi2gMYDhOd0AAyJSoDlLpSAbQaBgC4Y
 yXJSLf2d8BL12Y5LffiRc0cEcC1f786NQZC5AJqcHuG9a+srxRuLgWOrgoW0ujK+PYioajVdbBV
 hchjo9VSIH7Hezm/5BGmOyFvsQLA19OGEO5luQI2bvPmNL8VnUwpOOnrWGo4+OM650hITyDalM2
 726o/wiLMEJyv8RwLuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NSBTYWx0ZWRfX/NBO7r4B1e+S
 ogd2pcinXqp0jJ/0jTrGgo/ZqVtBypic2cAoONILwjyjmBN3LTHBr0E+YjIpzeEGOxKqT/1D9a1
 MmvolxXuJ29+BF7y3xMXawrErqvaarY=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aabdd5b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=gIm7KJJTxUf_gKF81MkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: t44K0n2JIhf3t6G3CA2dm3HDwxZAEwZk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170175



On 9/16/2026 2:53 PM, Bartosz Golaszewski wrote:
> On Mon, 14 Sep 2026 16:59:10 +0200, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
>> ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
>> there is no common driver that handles all supported psci resets at one
>> place. Additionally, there is no common mechanism to issue the supported
>> psci resets from userspace.
>>
>> Add psci-reboot-mode as an auxiliary device created by the psci-devices
>> driver. Define two types of PSCI resets, predefined-resets and
>> vendor-specific resets.  Predefined-resets are defined by psci driver
>> and vendor-specific resets are defined by SoC vendors, under the
>> psci:reboot-mode node of SoC device tree.
>>
>> Register the driver with the reboot-mode framework to interface these
>> resets to userspace. When userspace initiates a supported command, pass
>> the reset arguments to the PSCI driver to enable command-based reset.
>>
>> This change allows userspace to issue supported PSCI reset commands
>> using the standard reboot system calls while enabling SoC vendors to
>> define their specific resets for PSCI.
>>
>> Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
>> Suggested-by: Lee Jones <lee@kernel.org>
>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                            |   1 +
>>   drivers/firmware/psci/psci-devices.c   |  71 +++++++++++++++++++++-
>>   drivers/power/reset/Kconfig            |  10 ++++
>>   drivers/power/reset/Makefile           |   1 +
>>   drivers/power/reset/psci-reboot-mode.c | 104 +++++++++++++++++++++++++++++++++
>>   5 files changed, 185 insertions(+), 2 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 9c0334ee2ed2..1c0f111ba197 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21933,6 +21933,7 @@ S:	Maintained
>>   F:	Documentation/devicetree/bindings/arm/psci.yaml
>>   F:	drivers/firmware/psci/
>>   F:	drivers/firmware/psci/psci-devices.c
>> +F:	drivers/power/reset/psci-reboot-mode.c
>>   F:	include/linux/psci.h
>>   F:	include/uapi/linux/psci.h
>>
>> diff --git a/drivers/firmware/psci/psci-devices.c b/drivers/firmware/psci/psci-devices.c
>> index f1eca61e3269..43e6743202f9 100644
>> --- a/drivers/firmware/psci/psci-devices.c
>> +++ b/drivers/firmware/psci/psci-devices.c
>> @@ -4,19 +4,86 @@
>>    */
>>
>>   #include <linux/auxiliary_bus.h>
>> +#include <linux/device.h>
>>   #include <linux/init.h>
>>   #include <linux/of.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/psci.h>
>> +#include <linux/slab.h>
>> +
>> +static void arm_psci_auxiliary_device_release(struct device *dev)
>> +{
>> +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
>> +
>> +	of_node_put(dev->of_node);
>> +	kfree(auxdev);
>> +}
>> +
>> +static struct auxiliary_device *
>> +arm_psci_auxiliary_device_create(struct device *dev, const char *devname,
>> +				 struct device_node *np)
>> +{
>> +	struct auxiliary_device *auxdev;
>> +	int ret;
>> +
>> +	auxdev = kzalloc_obj(*auxdev);
>> +	if (!auxdev)
>> +		return NULL;
>> +
>> +	auxdev->id = 0;
>> +	auxdev->name = devname;
>> +	auxdev->dev.parent = dev;
>> +	auxdev->dev.release = arm_psci_auxiliary_device_release;
>> +
>> +	if (np)
>> +		device_set_node(&auxdev->dev, of_fwnode_handle(of_node_get(np)));
>> +
>> +	ret = auxiliary_device_init(auxdev);
>> +	if (ret) {
>> +		of_node_put(auxdev->dev.of_node);
>> +		kfree(auxdev);
>> +		return NULL;
>> +	}
>> +
>> +	ret = __auxiliary_device_add(auxdev, "arm-psci");
>> +	if (ret) {
>> +		auxiliary_device_uninit(auxdev);
>> +		return NULL;
>> +	}
>> +
>> +	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy, auxdev);
>> +	if (ret)
>> +		return NULL;
>> +
>> +	return auxdev;
>> +}
>>
>>   static int arm_psci_probe(struct platform_device *pdev)
>>   {
>>   	struct auxiliary_device *auxdev;
>> +#ifdef CONFIG_PSCI_REBOOT_MODE
>> +	struct device_node *reboot_mode_np = NULL;
>> +#endif
>>
>> -	auxdev = __devm_auxiliary_device_create(&pdev->dev, "arm-psci",
>> -						"psci-cpuidle-domain", NULL, 0);
>> +	auxdev = arm_psci_auxiliary_device_create(&pdev->dev,
>> +						  "psci-cpuidle-domain",
>> +						  pdev->dev.of_node);
>>   	if (!auxdev)
>>   		return -ENOMEM;
>>
>> +#ifdef CONFIG_PSCI_REBOOT_MODE
>> +	if (psci_has_system_reset2_support())
>> +		reboot_mode_np = of_get_child_by_name(pdev->dev.of_node,
>> +						      "reboot-mode");
>> +
>> +	auxdev = arm_psci_auxiliary_device_create(&pdev->dev,
>> +						  "psci-reboot-mode",
>> +						  reboot_mode_np);
>> +	of_node_put(reboot_mode_np);
>> +	if (!auxdev)
>> +		dev_warn(&pdev->dev, "failed to create PSCI reboot mode device\n");
>> +#endif
>> +
>>   	return 0;
>>   }
>>
>> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
>> index bce996bbef28..5c349f41e097 100644
>> --- a/drivers/power/reset/Kconfig
>> +++ b/drivers/power/reset/Kconfig
>> @@ -360,6 +360,16 @@ config NVMEM_REBOOT_MODE
>>   	  then the bootloader can read it and take different
>>   	  action according to the mode.
>>
>> +config PSCI_REBOOT_MODE
>> +	bool "PSCI reboot mode driver"
>> +	depends on ARM_PSCI_DEVICES
>> +	select REBOOT_MODE
> 
> Needs: select AUXILIARY_BUS

Ack.

> 
>> +	help
>> +	  Say y here to enable the PSCI reboot mode driver. The driver
>> +	  registers with the reboot-mode framework to configure PSCI
>> +	  reset commands, which are executed by the PSCI driver during
>> +	  psci_sys_reset().
>> +
>>   config POWER_MLXBF
>>   	tristate "Mellanox BlueField power handling driver"
>>   	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
>> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
>> index e31cab4ba78e..45d8aaaffaa1 100644
>> --- a/drivers/power/reset/Makefile
>> +++ b/drivers/power/reset/Makefile
>> @@ -41,5 +41,6 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
>>   obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
>>   obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
>>   obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
>> +obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
>>   obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
>>   obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
>> diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
>> new file mode 100644
>> index 000000000000..bf2dd6626feb
>> --- /dev/null
>> +++ b/drivers/power/reset/psci-reboot-mode.c
>> @@ -0,0 +1,104 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/array_size.h>
>> +#include <linux/auxiliary_bus.h>
>> +#include <linux/device.h>
> 
> [
> 
>> +#include <linux/errno.h>
>> +#include <linux/init.h>
>> +#include <linux/kconfig.h>
> 
> ]
> 
> Why are you including these?

errno.h and init.h were added for EINVAL and subsys_initcall()
- will remove these. available in psci.h

kconfig.h for IS_ENABLED(CONFIG_64BIT)
  - will retain this.

thanks,
Shivendra
