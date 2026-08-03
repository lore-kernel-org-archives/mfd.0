Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1889A40B111
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 13:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762445; cv=none; b=JJ5Ho7E6qwJRlFUQsGRvbvqQn/iYYTG+sE3nbSF5v7ev9LToHhPz1D0618tdEO3bgHybiGboVVn2GcaWDoJL+ii7TQZdwtbFjRVBFpT4Vc1gtXuC5Ftx5eou3q8N73S0ipLJWr5+wE5A7COiXMy7Jsd3Y/gvFaDYXiASYuQCq3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762445; c=relaxed/simple;
	bh=H9594XUyw3POtqMhfAsK0sI0aCBEtIDmlenuukjge1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C9oDpv8dBtR2aCo7cEhVHMtDrCk5LPTIPDaRH9LbPbhcjbDXLRxGtNHBOzVboZJt1zXeLIurOAL67XK8RZ7zkLP53Kh5zQwf0DZoxX9XQuH3puco7RJ67r0Hnn0+tEotLPVRTgv5qyMMnc/SIpJrvHSlLmT8CpNZC9+/tuT42bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfmEw9UP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDhGafJv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfmEw9UP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDhGafJv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673C4iq5530299
	for <mfd@lists.linux.dev>; Mon, 3 Aug 2026 13:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DV+TIe+B8KPVpKTDj8vG+10Yx2ThG4j+TkRNvCbR0tQ=; b=gfmEw9UPmfGBTj5/
	RYAtRA/FeKPGUyUxNRJUOhvZm7V6RYrsTQn6DTcfwQjUzLYKV5VeMf+LiPM8l+90
	0FTVd53M2x0T9spGK8ACKb5LjxYTOH4Q9T7HfVGzt9Xah63o19Iiv8tDXHeggv/i
	6LMVORNnT9RHwfxAN6y+wXLvxXIn6MI91JNdyBrX5m1xHjQoy1tDURp/Z34R/sGQ
	jHG69NXTLbURbLj9nEx4xJHt1o4x3h4Akz0u+mlJQyjfIFYXi+g7uM9dGeRLj+B2
	aOCqZXHkslyziE/r8PpOS/HtQ8z5R4icGNPEggzxXUFqmKDd0Pt2k8cbiByu1NDh
	pvAa3w==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhkhpgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 13:07:19 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7eb650e79adso3261925a34.3
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 06:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785762439; x=1786367239; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DV+TIe+B8KPVpKTDj8vG+10Yx2ThG4j+TkRNvCbR0tQ=;
        b=EDhGafJv2aBq33wtPIsLyu0LxcpoG/STlCsgB4Iew7OVn06OxbzOGWhVazlHEOnH/U
         awI0auaYJy4GYbrdimahFwg4pK+lyKmCM+dvOqNZHBnMONo75Tka8eqvmBPbhVfDO93E
         mbOKryOTIJ8+YKMjG+CUFCdxDwFUvkAr8hV5+Vu/4Ng6SVCEUy/qLIDuy+qK/CG9sha1
         UFOReyq8taWkmDj5pctxFrDvl6i+We1UHf48SSP54FhIxwHiYsZXB2LRG8PZkZd9hL5I
         BhAYfIGNT5VRDfVg8Eb4rKOQZOEDPf9wEwqcvgsoW7AcwgJHi1ETmUB+GJJlauFhxZrc
         WwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785762439; x=1786367239;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DV+TIe+B8KPVpKTDj8vG+10Yx2ThG4j+TkRNvCbR0tQ=;
        b=HNR4mZYFbtw9B9OxCNsCpJXImHCIjhYjrzs6EsooAueQoOsHmW2TjE6vlNtkeNarPy
         qD+eJl5IpoEPX1nGZwM/O3AElI822s5EDuHAXwHUJEeMQdl0EOMWwj/5EgKSKCXPME2W
         199InQL4LQqGJ1xyCRcdV//AWlwTQp9JNuzV6GfMtvFhu9blfFrExt1jTAjgiGE3tDi7
         UWTL274dRMwiowGesh90zUd3JWDCsOTWUphFs494H2+I2yK08q6C2OTRM1l4Ty7CFTLA
         SZoRPDxpaXU83irpRc8o4Xylw8yfYFIOZVtHF4iIru9ZMbv1vzLMRjxeYlTtywKSZqN6
         83VA==
X-Forwarded-Encrypted: i=1; AHgh+Roy6EncoSbF8dPErUrcbekhlQbbmRvE6eunQr7XFLXc/qbXh2BNVpBzQtJxuOOvtKWSJBk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTToDavYU9sMBp4I80jaKnIAtHcEDMSt3Zebtm4WTXsqcP4bWy
	314RtP2HHbWCX57T8S11Pr31KNzOJBdfU059L8+WnM8Ua7DXtQU16eD6tqzmmiT5nJPYrNTIJjZ
	U1wcXEPZ8pEyfeJ/1SaeqXnYdXYQvlXmjHZXz0f48RKWNfuj7/3e1Fgg=
X-Gm-Gg: AR+sD122npOl2iAQNF6IoK/FSqnYhAcfdhWtJAIL/lQpYj+NqO49B7VwD7B2dwjKZTb
	AziYZSnJltJu0AQymHN55b7tArtGufVzfwRgmf6ODZcuuPoSo/H6QUTzHqxpIASSOlTOmjbG1jB
	xRzHHOH83RQrDWVH0vzxZQz80K1MKw+W9ovH+k8vnbEItCtNA6PAOclccJJhmghBQ+p5OMDQLSU
	NY1iLEB91WtKnoflmziJRiYNDTMuiPukpd1NWeH70q79LxesNJyFrgm9KpTWTRq+zU8dzq78ddB
	k5elamO3uJF5qQ1SRuUeqFEIl4H+R90NxQL1JM97UdZiSiSbWcCKmM7/WTKQX9tVk1adazelPhJ
	XTT/fi4/FO3sDsasQadb/oiPhaQvE8lGv3A==
X-Received: by 2002:a05:6830:67f6:b0:7e6:e022:4b44 with SMTP id 46e09a7af769-7f196f1c52bmr16095995a34.15.1785762437584;
        Mon, 03 Aug 2026 06:07:17 -0700 (PDT)
X-Received: by 2002:a05:6830:67f6:b0:7e6:e022:4b44 with SMTP id 46e09a7af769-7f196f1c52bmr16095923a34.15.1785762437054;
        Mon, 03 Aug 2026 06:07:17 -0700 (PDT)
Received: from [10.218.44.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18ed3c81fsm7306578a34.5.2026.08.03.06.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 06:07:16 -0700 (PDT)
Message-ID: <f18569ad-3e39-4d48-9ed0-968af4e31c40@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 18:37:11 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 06/12] power: reset: Add psci-reboot-mode driver
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
        lee@kernel.org, mfd@lists.linux.dev
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-6-889281373870@oss.qualcomm.com>
 <20260803101117.C91CF1F0155B@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260803101117.C91CF1F0155B@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vNdmOaD56QKP9x-l5rRsXkmo3zt2nopR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDExOCBTYWx0ZWRfX80qeY2JGSDCv
 r8roNUdynOXJWUmc4gX8gkLVjOXpDyOLna0GnaeRU/nEvUrUsC95qISojeMwxDGGxy4znFjygbk
 qKSNW9tZFuDdvk9kgt5qJSnNiyUJpaHgAeezkHGXxbkpJNfYtIzsYx06+mnpaap3s5UuASmFTxM
 dAtOLF4u/BOvVffWBhcTrYtPccwTRFalqq0etVVuY55mHUvsTIJPWjdDv3OJkJuITGbURR1W7d/
 PLaIbkwYe27/gr06XQSPlenAGr26YNArLCqCT2BMNMOjdOmkV1RDx61xSgxBvKRVqPld1Lxhjyn
 567+cvncF+U5oJh9R7bp5YYLyoR5qqmPR8hhANO8jfLE3oDE4IDWH5de8G5mQ1+S8c0Fp7nZUB7
 Zg8ilb3s7pAXgFCw6CK+e/DGKU6lQBdl7c7iSzVRJ0lfulhPdZ9YBuPlkooH1ocEsG75fy1k0Gq
 29OxYDF6wgXPeUoyX8g==
X-Proofpoint-ORIG-GUID: vNdmOaD56QKP9x-l5rRsXkmo3zt2nopR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDExOCBTYWx0ZWRfX2bwHvbi6SYzQ
 Fmek+ifH55JWTn1xsd0YtfrQWyhBQjiKkaUaCZvBenIvFjjfWDoRDWiulq1rE+viQjaG0J6jscD
 KYHRPqqWp67Yc+PuHSUzmFReTY7omJA=
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a709288 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=-TrfgTw52sERH2XDXHIA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030118



On 8/3/2026 3:41 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The `psci-reboot-mode` driver is completely unreachable and non-functional because it is never instantiated.
> - [High] Standard 'normal' reboot mode commands are entirely ignored by PSCI due to an incorrect `data` check in the restart handler.
> --

[snip..]

>> +static int psci_reboot_mode_write(struct reboot_mode_driver *reboot,
>> +				  const u32 *magic, u32 count)
>> +{
>> +	(void)reboot;
>> +
>> +	if (count < 1 || count > 3)
>> +		return -EINVAL;
>> +
>> +	return psci_set_reset_cmd(magic[0], psci_reboot_mode_get_cookie(magic, count));
> 
> [Severity: High]
> Does this work for standard "normal" reboots?
> 
> When a standard reboot is triggered without a specific command string, the
> reboot_mode framework translates the NULL command to "normal" mode and calls
> this write function to configure the reset command.

No, write can be called only if a mode entry is found that matches name 
"normal". And there is no mode name defined here as "normal".
> 
> However, in drivers/firmware/psci/psci.c, psci_sys_reset() skips applying
> the command because it checks for a non-NULL data argument:

> drivers/firmware/psci/psci.c:psci_sys_reset() {
> 	...
> 	cmd = smp_load_acquire(&reset_cmd);
> 	if (data && cmd && !panic_in_progress())
> 		psci_handle_reset_cmd(cmd);
> 
> 	psci_handle_reboot_mode();
> 	...
> }
> 
> Will this cause standard reboots mapped to vendor-specific commands to be
> silently ignored?

does not affects.

> 
>> +}
> [ ... ]
>> +static struct platform_driver psci_reboot_mode_driver = {
>> +	.probe  = psci_reboot_mode_probe,
>> +	.driver = {
>> +		.name	= "psci-reboot-mode",
>> +	},
>> +};
> 
> [Severity: High]
> Is this driver ever instantiated?
> 

this is probed as psci-mfd child.

thanks,
Shivendra
