Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F63353A74
	for <mfd@lists.linux.dev>; Tue, 15 Sep 2026 14:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481136; cv=none; b=j5hOLMAjvl46dGB/udrSS71seCZ/pCPT4QaG12P4bztjiKJmhxoQay5Pfp1XDkB6umWr5RAAE58ihkcDihRoH+3laFrCxJn9gSBjgrNW12TxcLSPhRWRJ45VwqQve/xiCUaZoyDcRPi3A8ekNV5b+SOAhgzQvvbn/j0l/hMqfuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481136; c=relaxed/simple;
	bh=NshLfx79PxnrJE0/5Fcr4m6nwAdQ30gIKulPsOZ+cMU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cICVijEkYdd8omkkSpWSXUdk26xISpQSG4c3hL2Nh7r3UXnT64M7mAwXtNvk6XpWQr9ouFZRbEEsPll4vuBBQWbvZqgHt00gaUiFMNNSTi1GdpcwSk6vx6yVEt+yKajyt4NtydLXXcZIujXW0prJyLOel0cKDRL6E4HFozo1Dog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g6yJWMnG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GDZYe6sG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g6yJWMnG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GDZYe6sG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD04nX3654709
	for <mfd@lists.linux.dev>; Tue, 15 Sep 2026 14:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AdtOepO6CLMia926RowP3TKcd+bOiHq21Mopgiw2qU=; b=g6yJWMnG5cMLiX4q
	UgEUCdyihpj0buUOxOcCKcTnc/7RmiDmqLhyN0Fq1LM/MrMclNodfr9DpKMRkyrM
	9gc6Ye+uvogsGTlTFhNdsPyqtH8NMrLpfr4puDh9rYMbIsoD6JjhNOC0I5BvFNZi
	5gMLzms3xibt+q7YwZ7pizufzqnYl3nkPPtj6ZPY4quYU+d/yiW3DTZTueiXMJjz
	orsInwFRux9XieNHzFa/h2aJlmqljLYu0CF1nRK5Ueny2Ok5ZLEstiefptJ7lv+2
	8WPuWp0aTgohjzjrSxoasj6KQcJgVZMATEzm3CYlC3eSMsQVx3gQr2tmUzJB0p9Z
	Vl/D/A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq2y2h9rg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 15 Sep 2026 14:05:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-869b8d63e28so5582230b3a.0
        for <mfd@lists.linux.dev>; Tue, 15 Sep 2026 07:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789481132; x=1790085932; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4AdtOepO6CLMia926RowP3TKcd+bOiHq21Mopgiw2qU=;
        b=GDZYe6sGdUby98FCth12t9VvRQ5rhN9nlPK7kYYGWyAGQMuCbqiE+xhp5Z7Salmocg
         Uv5Ogcxvb1ZdwHm1Bds1qe2FfmnY0Ji6ICORj5JNLS1qL4QpfIZ2zBffmX95mwJT/Jn+
         l73cOGGNkFg1PzIpw/CfNGryAA0S+OTfX/fSHhS8nxYoVRGAuAp3pq5w/ySTm/3cgzCG
         JWjx5sR0OUAbExGXBp0P/sNTMfyYRCWUrRBI1sdBfjukSgH2AojUr96kk3vmJNmLjPR8
         RLI+WRFsGg5RKEQJJpMGsykydw2S8p4pmlhDiMA1rBA0pPwuy04KFCxyTMBDg/vE87lH
         Ygaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789481132; x=1790085932;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4AdtOepO6CLMia926RowP3TKcd+bOiHq21Mopgiw2qU=;
        b=wwnDqA1qg4CL9dsJCCvRfiuB2HbM1wqrAd7+tpuHnbaFb4evZKVcskfSJORy541QE+
         iM1EDNgwtyMBgasRGHxGM1FKfItAeoGYiJlBcXNTnsf9JHgrpkzlYhVsxK3rGMSgAP3p
         4Tx1luCiLw7GFc6k0n4lVAxhbk8twcL8XtsPS7/5FKg1TBawchhoP04vaz2qCm/KgRrz
         6M+tr58a6+n3tNe2VX8SIYbrtfeki5EReSI42bFGeYQMdWJSK78eVyDANnO5Q6kI5RVC
         hAauJvZ7N3VFcVl+0c37UEddTw0j4MG3SjKRG6HCBbxGbA5fvWw9G3WUxl30ZLSmqvlA
         cyXw==
X-Forwarded-Encrypted: i=1; AKwUvBx9+PKTmnUV2NEqAcJ2hfEDOUBentvn0/nZ9OZwO3dLQHFymp/BdL6kmQus4uBKx5GzpyY=@lists.linux.dev
X-Gm-Message-State: AFuF++l2zLiJNZEhaceFgvF9L/X9Jj45mn/ptq0sPwpsIG8S7/sCukjW
	JeNOYpGI1wgnMjn/uQ7YaHi3gxFCeGCSmrkTgw+rhVI9k9gBhZ/HPqIVsKyI+oqW1imi+4pP4kY
	JYlg0MLwsWEfQFSprbawx27KGzP7tHOyEzMWEpR/pyVAatMOr7gR2erM=
X-Gm-Gg: AYBFou1RD9bi81/r9bFvFiiCzALNtulXy7zePGdjsQaYWuPZu6QYfqzBDOpFlQIFyWF
	rXrBeuk1FD8xwUoHcw6aR1xNyF82EQiw3+gJCsSD2HXgvCjNsNJk5dMdEN45r1dJ+4D86zeOnWC
	T8TLe1dDyb0faORi1xR8egEzC0tq4rPnoU4xeeB4l1vrkREmZJKKJmgPuXRs6GDcxaKhM20D/J1
	51A0l5OQO3X7lRmkb434huKuNX63aWm6UDTnPUV6gsa0P7wKaL0V45rCfJv+fm1Gjgj6Jlm3l+e
	r0hXJXwSN1BtLKvVcA3+5flda7RTATM+ZEx9AtTEDvrnQTQAlqzQpxKMNwVmTHPz7AuGmajpHLA
	abTCvrIxwNrTlSxGYA//AE/Qnm/fdVyiN
X-Received: by 2002:a05:6a00:3995:b0:84f:a82e:d32f with SMTP id d2e1a72fcca58-86f82e5bc49mr13252810b3a.3.1789481131970;
        Tue, 15 Sep 2026 07:05:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:3995:b0:84f:a82e:d32f with SMTP id d2e1a72fcca58-86f82e5bc49mr13252736b3a.3.1789481131402;
        Tue, 15 Sep 2026 07:05:31 -0700 (PDT)
Received: from [10.218.9.75] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29cbb0d3sm6368827b3a.42.2026.09.15.07.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 07:05:30 -0700 (PDT)
Message-ID: <aac5b5e0-89e8-4b78-b93b-ed97ade4f1a6@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:35:26 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 03/10] firmware: psci: Introduce command-based resets
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org,
        robh@kernel.org, mfd@lists.linux.dev
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-3-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914151400.D99051F0089A@smtp.kernel.org>
 <0f5a8bf1-9ac4-4b0e-98cc-5bd833896413@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0f5a8bf1-9ac4-4b0e-98cc-5bd833896413@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: M73PyD0_9KEVy5EuQtRmeiSoYJxMLyjw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIwNSBTYWx0ZWRfXzem1SGVbOBFk
 7dxMXtlsNV7xJ6IV9ZjEstFIldPHnx1Mi7QAH43IervZ6dpeystOsWzYhcsAU9D/cioOagrWSAK
 kNZZpK6edJtJXgidFYgw8JzqYCbRd4Cuw6s28ADJEiiFM4UWcGLiFcQWACRqor7r64u+NU6uPom
 nu1KrofM6RC8jx/RHVKrv3+PZ2QidY88zlGNk0qrLYp2t5ayUEB5unM1SCzRmNTBbKtch+4ng2S
 QCq6LDHZSrAD0jFAEFSLmZ1Cpr8KgATs+SKDwr3Sx5ZXu1qt2l0m3eiIiUPCvV2RgvXOB66V2ql
 sSMsgW/thB6hoB6BNZCmMqKr+c6vK7xKTz6Z4E+CcPUfANcSrwsidE0tvCOshmAHVPiIsZCW6Xc
 Ukg6B5LbmTK4JQvQrd8IajhrCY5tkrca6flsI7SqG3TTAyDMl1YIkxHiNKbdeDGjyy5EdeY/JFd
 617eoT/NM0q1yVx8HRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIwNSBTYWx0ZWRfX91+WZq7r1s8C
 7zOQDe8/pdGdGyK60kltKRDmAjU/ztQC/pSrgqHB1iCsRmF7aF/QRFmvNVYIY1bDQTE+m4HVbLC
 jc3nBmPM1pmKFYVz2YNRRKVg/9hxPcs=
X-Proofpoint-GUID: M73PyD0_9KEVy5EuQtRmeiSoYJxMLyjw
X-Authority-Analysis: v=2.4 cv=IcISymqa c=1 sm=1 tr=0 ts=6aa950ad cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ez_dwArMwaZOn3ezCW0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150205



On 9/15/2026 7:32 PM, Shivendra Pratap wrote:
> 
> 
> On 9/14/2026 8:44 PM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential 
>> issue(s) to consider:
>> - [High] The restart handler `psci_sys_reset()` unintentionally skips 
>> configured reset commands for standard reboots due to checking if 
>> `data` is non-NULL.
>> -- 
>>
>> commit 15791809d0deec27e24e64483b3317dacb5842a5
>> Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>
>> firmware: psci: Introduce command-based resets
>>
>> This commit introduces a command-based reset mechanism allowing 
>> reboot-mode
>> drivers to specify custom PSCI reset commands like vendor-specific
>> SYSTEM_RESET2. It defaults to the existing reboot_mode flow unless a 
>> valid
>> reset command is configured.
>>
>>> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
>>> index e73bae6cb23a3..d489ba5d147ce 100644
>>> --- a/drivers/firmware/psci/psci.c
>>> +++ b/drivers/firmware/psci/psci.c
>>
>> [ ... ]
>>
>>> @@ -320,6 +409,30 @@ static int psci_sys_reset(struct notifier_block 
>>> *nb, unsigned long action,
>>
>> [ ... ]
>>
>>> +static int psci_sys_reset(struct notifier_block *nb, unsigned long 
>>> action,
>>> +              void *data)
>>> +{
>>> +    const struct psci_system_reset_cmd *cmd;
>>> +
>>> +    /* The function psci_handle_reboot_mode follows reboot_mode based
>>> +     * reset flow and psci_handle_reset_cmd uses reset_cmd based 
>>> reset flow.
>>> +     *
>>> +     * The reset_cmd is configured at the reboot_notifier phase.
>>> +     * If panic() or emergency_restart() occurs between the 
>>> reboot_notifier
>>> +     * and this final reset, skip command-based reset and let 
>>> reboot_mode drive
>>> +     * the reset flow.
>>> +     *
>>> +     * The function psci_handle_reset_cmd invokes non-returning PSCI 
>>> SYSTEM_RESET
>>> +     * calls to reset the device. If it returns, either the reset 
>>> failed, or the
>>> +     * command was unsupported. Fallback to reboot_mode based reset 
>>> flow.
>>> +     */
>>> +    cmd = smp_load_acquire(&reset_cmd);
>>> +    if (data && cmd && !panic_in_progress())
>>> +        psci_handle_reset_cmd(cmd);
>>
>> [Severity: High]
>> Will this check unintentionally skip custom reset commands during a 
>> standard
>> reboot?
> 
> By design - Normal reboot with NULL command should go through regular 
> reboot flow of psci_sys_reset.
> 
>>
>> When a standard userspace reboot is triggered via the reboot syscall with
>> LINUX_REBOOT_CMD_RESTART, the reboot sequence ultimately calls
>> kernel_restart(NULL).
>>
>> This propagates down to the atomic restart notifier chain in
>> do_kernel_restart(NULL), which passes a NULL command pointer to the 
>> notifier
>> handlers.
>>
>> In psci_sys_reset(), the data parameter receives this NULL pointer. 
>> Because
>> of the check for a non-NULL data variable, the condition evaluates to 
>> false,
>> causing the handler to skip psci_handle_reset_cmd(). 
> 
> Yes, do_kernel_restart(NULL) should take regular reboot flow and ignore 
> any pre-set commands.
> 
>> It then incorrectly
>> falls back to psci_handle_reboot_mode(), even if a valid command was
>> successfully configured by a reboot-mode driver.
>>
>> Is the data check acting contrary to the commit message's goal of 
>> ignoring
>> reset commands during panic and emergency_restart?
>>
> 
> If the commit message is not clear, i can add a line to it, stating the 
> same.
> 
> thanks,
> Shivendra

Adding Lorenzo and Arnd for views on this review.

thanks,
Shivendra
