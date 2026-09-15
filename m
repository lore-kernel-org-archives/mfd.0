Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41FB348C4A
	for <mfd@lists.linux.dev>; Tue, 15 Sep 2026 14:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480960; cv=none; b=qGp2lbwjI4eLApweKuGPdL7nSvaE7pXNgWsAVarLb5aEnI8CflxpJ/rtofeUaA5gyHZb05zU9ABZ/44+BdNI+8OT5Wje/NXaxYtHhiiUknkgcgX17XBJR9IDSKphGjRELoeW1cdM+77CQ/SGBoGOmOgdznkNq+hsJ7P3nLwdylA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480960; c=relaxed/simple;
	bh=m1ZCIdhEkGSNduyzeC0b60Lirr9R+b9XNCmxgkDimZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pyf32tByvH/J8fgaCC20jYNuM4VzaoJs7HIC3E8GNt10v++cfIWWR9rJb/EM6aClvFLQ1EZiVelcfIvnoEFKcZawItAHxHcQA2ujDY+WUANI8qq8Sx09D92jvClb7dVOYwH7NKB9hOkCjSkmkw5nAQXJK4JFAkS/COtIit5nQzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CJY+Hx2o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=elbQwX91; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJY+Hx2o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="elbQwX91"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD04mh3654709
	for <mfd@lists.linux.dev>; Tue, 15 Sep 2026 14:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VsHb5iUgXuTAwcEpDAmebqdJ/8KokXjuvf8o0kgvjyY=; b=CJY+Hx2oRYr80Rhc
	KiYdvbVTWdty+PzZgmTfAa9Dh/Q/ROzCfBFAUgeAv1JBOZFxEaBRNURyRGRHZV+K
	WJ302fRmEiFE2j4h7oZSq8vHSlREXf1eZGvHncBXLCM//JPJltGROPuXMzribKt1
	Be8xgSDVhxb6AqIAsvLAufhU6qChEqDtxRzypJA6GtU5Liz8z7KLsNze6KA919OU
	5pfxXuPmiXwtYIB5ikyt7+dl/BJB7HhhFmkpsDyojJMxsbEXLi9jFLk+1AGN0uEO
	gLyPJ8IcxCYewVsLRdbZ2oZtNSos5DIU4WDcE/l9krUNTgs7qIxjnsMSU0yIYw18
	Slek4g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq2y2h980-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 15 Sep 2026 14:02:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so11085169a91.0
        for <mfd@lists.linux.dev>; Tue, 15 Sep 2026 07:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789480956; x=1790085756; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VsHb5iUgXuTAwcEpDAmebqdJ/8KokXjuvf8o0kgvjyY=;
        b=elbQwX91p6xq+8pJ6NjoTUzuUqcRdqRvkNRvYfiduk7/UV0gpe5rUJI9DMeAMXi+XF
         JR72LZR3eZpjbrfzB54T3yLtjOMVNe73omgVB2tWCn64vBgLAFNlx3+33alTgAn8fFFg
         kY0uGBgErd49Ivlf1l6JTj83dXlqssIe5Lli2A6G7kTN33PcE/WS+i3+px0jpqq+VLLk
         YMe2J33Qi0eDPvdbHF7kC7Daad9HiCouKINBJ1vxXS2xPbEEspfOPrVtLQNj84fZsI4n
         PNUy58h2Ncs+JEqmq/T7gHpxaFafv1dCM9yPyzMpEzZFG79N1SyV5MZXDMa0o3zRDzaJ
         05EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789480956; x=1790085756;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VsHb5iUgXuTAwcEpDAmebqdJ/8KokXjuvf8o0kgvjyY=;
        b=N0zfDEFMWR4tG49iXOjq+1LxeWjaScprQ+/aBc+ouQfImIJlcWuz06OHlPRi6lSoDR
         EiRt+/gH/UVm084F72gkoDO6Fu5Pz9yFl1M9OgQr6cJxUMFnS3EovjxVQ2yOi3Em2f+i
         YmwSpI6cfCcgRzFjqBnuDg4CAWRy6SMMbNH8w5zokdwdWdQHG9tnmq8sPvqGIJauCjR8
         8lNHMBF5q2EgPg5TXOZHpoa3t/k6tDe0bWyIsrkAQOQy7ysJVdmqQusUbYpNe8sO4YI7
         njfa9mj2EeEWopn+MHu8rW7GNDXwzY7lUXyWuMW6NU78yuhUvFoCo5YAtSQ2WNUTNfjD
         QJIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHUwrlXsET9SckDzQZqgQymCTVOy46/6u+UYwEnPEvj3EUuA3igRZ5jmwFI0+R0RHDfKA=@lists.linux.dev
X-Gm-Message-State: AFuF++nXwM0ifHeHDZYaR/qUVezB8quJtAygKgvc3D/uthMnk7nYWnsI
	JwNBuikgEW++gZJkjy2zpUzLALgy9X1Y9Q39CBFb8/7pIysispjBmzue8UyVRJb1ejyPDXgFpMb
	BBpUR4efgbsuKiPCNpCQYlccmGHn+wcbitQYfzz/2cTzIJWy9nz4w1YQ=
X-Gm-Gg: AYBFou1dX0Ju9cdVtCEGrkQTsDebo8VAwnnUFrYcSPMogli9AqgaKg2L3LWmRgCdOsF
	sGRy5d0OP2AfGh9fjyRU1t17B5tWfxOMo5zwEsWq3/060YOjPwMOa/L5KDCOoCQ601xrZmvvPvK
	3HlVeD7XzK8Et1dXbbXZWxl5S/0N9/CMfbUjpExj1T8g8xaKAdcaJlx/SHf3x7T0lm1Jh2hG0QU
	eQ81+6V3Su1U1CUUbxH307YK+nfclSwmdI3Y0uoJTckIGQkH2N/KCEaEihhUe6/kVQLEFgt8KPS
	6Mv6pkDQIq97w8eGmQSUTPnQ/rMI8/ITMDgCuMXtI45rZuAfL3zbWywkY5k24sQYl5fVwIzrTC2
	CpKcKRcmK5qYrub4KoheJDqedLKr5kI6y
X-Received: by 2002:a17:90b:2e4b:b0:39e:d2a:e2dc with SMTP id 98e67ed59e1d1-39e1104906bmr1919284a91.12.1789480955897;
        Tue, 15 Sep 2026 07:02:35 -0700 (PDT)
X-Received: by 2002:a17:90b:2e4b:b0:39e:d2a:e2dc with SMTP id 98e67ed59e1d1-39e1104906bmr1919233a91.12.1789480955433;
        Tue, 15 Sep 2026 07:02:35 -0700 (PDT)
Received: from [10.218.9.75] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd561e2af6sm46699235ad.70.2026.09.15.07.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 07:02:34 -0700 (PDT)
Message-ID: <0f5a8bf1-9ac4-4b0e-98cc-5bd833896413@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:32:30 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 03/10] firmware: psci: Introduce command-based resets
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org,
        robh@kernel.org, mfd@lists.linux.dev
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-3-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914151400.D99051F0089A@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260914151400.D99051F0089A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BsbkKbcxmwbgvKzAasPO3R0eJ2g_fwR3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIwNCBTYWx0ZWRfX1rww4YOJc/Xg
 ZYRYccWZnCX3soogM4pu0sLWcB0AL811kCxBI+fo335hixNTmqr7N/p3E4uS+fEx8WMw5JW6ajb
 8SsjMmtWpcX5R+9hJyojxusTRgHcjMrvI53Z1opAUTPMvxuE/oNkuCcPy5hkNTwzTKwA6JWW97o
 ifRrPI5ee7URdWzMYLXyXgz5vmo/xpaxGiAhEIb3bAPOYvxlRg5K8/JZB7uCkyXnImkya5rPk/m
 hnLXl/GWsJ95A4pJh9ppCrf73Kl5fXxpw5K8TiphVMA6tHOjb8jna9gGPmZYJP/cg8mDcpbhuDv
 jLidPBx7YOyH/VIwRhXGUGxvytu9T58Y72jy+Gi4B0jCPYj6GT770zw+RWEz0gc2MP5cHqFhXt1
 R/uZobSzGpZGLgSL1NpcFeVmRSSsfkAjJMlcOs4fK7T1O7shhMe7QYqNFos6SqclR9WkG2aP3rd
 EG2vN0ftU4rSaPhi/Rg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIwNCBTYWx0ZWRfX7rLTUCrwNfkV
 G9YZqf5DLEuy2u5vvAJ401o5QWgtPbSALPFM7hcdKw8olJO4JcNAlJ526r4Gj5oC0uo+chHW0VV
 jbhwu0TOqM2gZByahka1ttKwsfmbaIE=
X-Proofpoint-GUID: BsbkKbcxmwbgvKzAasPO3R0eJ2g_fwR3
X-Authority-Analysis: v=2.4 cv=IcISymqa c=1 sm=1 tr=0 ts=6aa94ffd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zKE4ULxP5i7x29BA47AA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150204



On 9/14/2026 8:44 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The restart handler `psci_sys_reset()` unintentionally skips configured reset commands for standard reboots due to checking if `data` is non-NULL.
> --
> 
> commit 15791809d0deec27e24e64483b3317dacb5842a5
> Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 
> firmware: psci: Introduce command-based resets
> 
> This commit introduces a command-based reset mechanism allowing reboot-mode
> drivers to specify custom PSCI reset commands like vendor-specific
> SYSTEM_RESET2. It defaults to the existing reboot_mode flow unless a valid
> reset command is configured.
> 
>> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
>> index e73bae6cb23a3..d489ba5d147ce 100644
>> --- a/drivers/firmware/psci/psci.c
>> +++ b/drivers/firmware/psci/psci.c
> 
> [ ... ]
> 
>> @@ -320,6 +409,30 @@ static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
> 
> [ ... ]
> 
>> +static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>> +			  void *data)
>> +{
>> +	const struct psci_system_reset_cmd *cmd;
>> +
>> +	/* The function psci_handle_reboot_mode follows reboot_mode based
>> +	 * reset flow and psci_handle_reset_cmd uses reset_cmd based reset flow.
>> +	 *
>> +	 * The reset_cmd is configured at the reboot_notifier phase.
>> +	 * If panic() or emergency_restart() occurs between the reboot_notifier
>> +	 * and this final reset, skip command-based reset and let reboot_mode drive
>> +	 * the reset flow.
>> +	 *
>> +	 * The function psci_handle_reset_cmd invokes non-returning PSCI SYSTEM_RESET
>> +	 * calls to reset the device. If it returns, either the reset failed, or the
>> +	 * command was unsupported. Fallback to reboot_mode based reset flow.
>> +	 */
>> +	cmd = smp_load_acquire(&reset_cmd);
>> +	if (data && cmd && !panic_in_progress())
>> +		psci_handle_reset_cmd(cmd);
> 
> [Severity: High]
> Will this check unintentionally skip custom reset commands during a standard
> reboot?

By design - Normal reboot with NULL command should go through regular 
reboot flow of psci_sys_reset.

> 
> When a standard userspace reboot is triggered via the reboot syscall with
> LINUX_REBOOT_CMD_RESTART, the reboot sequence ultimately calls
> kernel_restart(NULL).
> 
> This propagates down to the atomic restart notifier chain in
> do_kernel_restart(NULL), which passes a NULL command pointer to the notifier
> handlers.
> 
> In psci_sys_reset(), the data parameter receives this NULL pointer. Because
> of the check for a non-NULL data variable, the condition evaluates to false,
> causing the handler to skip psci_handle_reset_cmd(). 

Yes, do_kernel_restart(NULL) should take regular reboot flow and ignore 
any pre-set commands.

> It then incorrectly
> falls back to psci_handle_reboot_mode(), even if a valid command was
> successfully configured by a reboot-mode driver.
> 
> Is the data check acting contrary to the commit message's goal of ignoring
> reset commands during panic and emergency_restart?
> 

If the commit message is not clear, i can add a line to it, stating the 
same.

thanks,
Shivendra
