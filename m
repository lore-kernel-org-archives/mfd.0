Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945284;
	b=p0qqfpLXQVrjy7oJGRiVlyikL/tIOlnjeFxMBYm8PQwrci+1kGBjG6Rm0+SPquHeEt/q
	 pYuc2NMZsCvO9EhzFBb3d+CVv0JWYZahJq7eh0kXMd0CqhVsjzzbgTtK5Fk/QmXdOlc+h
	 GtJpei4dcOGAXHullElkrb+ufDI+NCClWwj/Lnnbz52VILtd2tzzOQ5XPywhlNhOL1UC/
	 8SPA4zgwCtvS2eOs23WqFTNtY0IKUYP5cLQ2l7WAuvkzUFBxkwvi25pf15PlnDKY8MPD6
	 dyVk4Qq2N9LddJDaF15ftX0fuTVQJNEegecJcFR6d58GhVVPEpFASXM+0A2vgHwxh/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945284;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=o//CM1EA4RoX+EjPvzr1O0MDXhsmTL5cJW+JbW5CHYI=;
	b=1sBx9s75SihU0IDRSBVu3voZw3/Hdx3kzK8AXUGy3zk6y3KzEy6yYAiAocHGQYLWkRh3
	 if96Qu1xBUHD35yRcbV2zbVBmzD2zkXh9RDcYMkkWp4GTbI5FK4zQpGVPqAFo1QSxC6SQ
	 8+e7HoE9sfNUtiLkeb8srDeySK0PC8YfvG6WYbUsC20LSSRDHiFmuVQXydVTMEQOAYRaz
	 mIy7qG9Gk6FEoljkx41+0WESx6u/5Luu+J67MSd7Lsc4p6dFRjQvwo79QcclxG2XsAmTZ
	 nH30h9mZf1IT6Tm/XMPGDfNPze7+GKwkYycS/WzdkaQSKkG5cxeNhPBrHyaWcMCYxkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TDGEt/lV";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cQY7dT6U;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266E6606D803
	for <mfd@lists.linux.dev>; Fri,  6 Nov 2026 06:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 266E6606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TDGEt/lV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cQY7dT6U
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A641M202473934
	for <mfd@lists.linux.dev>; Fri, 6 Nov 2026 06:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=o//CM1EA4RoX+EjPvzr1O0
	MDXhsmTL5cJW+JbW5CHYI=; b=TDGEt/lV/TK1fCbFrvVsq7/2pd8YrzuRzJllk3
	rWX6N4wccKqgyObWn40mdbkEn800raN1FQ6TDQQAAQ6P86slarkCEjQwF1QB7KX4
	0asjLd9iB1SrusMy+pgJ0LVVrPM8Y48sxO7Dior8JB9T8iAdWwXgbrh2RAuP6QVa
	HMfuGCjANEAOZaQSnJ96gyntwN7KEjW74sazpu/2CE+2OCer41qDJWNeSuHmhS/L
	7NIFZ25pytXzO3fOqj6zttZ1lh8PzeCDlQcdDCcHf2wAz5jWhvmnFParTukobKai
	/GE606YbI8cVNj3JCKOXsk3DY9WWTdtVYco22ihE2wR3/Jrg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa17tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 06 Nov 2026 06:08:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so517937a91.0
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 22:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793945282; x=1794550082; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o//CM1EA4RoX+EjPvzr1O0MDXhsmTL5cJW+JbW5CHYI=;
        b=cQY7dT6UcSxGZ6DoRCOWCYXp69176SYLk3qEoVB0SaSlkg8D/eLZbH93nFr5QEzxd7
         bxBqE+QEvK+8rTWXiU28vmgMl/ql43qqX6kly/LIkxtaES5VRUaxHXzePpPIfJDCPD2i
         dydYHuq7NdSGKIpQrQh61K0zJwYeAyYTU8iBQXcwGqbyV++Q00v3Q0TzH95oNmPWlsGI
         o72e3o6wWgIpzl4YJkIrWtGosF+s39GGnPLKluPBv9oxa0ZgZwAdnkfM2InZpkOj02aL
         B8WgudqxFwOYypRlN9j/u1HEFExyJ64J6KkOftfWHTLPCB7p65osE+bp7wx+8mELrODx
         c+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945282; x=1794550082;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o//CM1EA4RoX+EjPvzr1O0MDXhsmTL5cJW+JbW5CHYI=;
        b=R7rpc4/oMw0vLpfNTSbFH56go5K8iFpjnVJ66c66nCNvTAjgXc3O9pbKRihRWqbgM6
         cLBY94zWJ9cNfDRxVIZvKfOO9jnw8sVWrCcHx8U/+B9sUnjv+kdqACy3YoAGHx2PAaeZ
         2ecuGYU9bmL02Zox/v7SaOKeDf503qBmmSw5gE+BnpKhoyriMJrdIUhDJsi75NMVdPQf
         tIVkPakV9CUC5RSrw9ShfDzIFqyvwXDccs9b435fdRk2fGtSVi6vudCTNGDjqJzvT1Na
         rPITGV0e98zM4fghEfjy4riKqUwvXN4lyHobX2J3tzrYUXqP6D7g8HHvS+F02ab9G1Vc
         ce+A==
X-Gm-Message-State: APuU4Z/Bs6H9k1OGc/CKxLig83ViX+fIygWh8pxaZXaNXUXEzCjfl383
	fLbwmEJ2X921VtayST7Um4QNp/UbJB2Fi7VPFXWLpyOSfcBobp+aFwVEqhE/jxxqBNJvYFNzVQE
	I8tRsEIxZxbHM1GPYqk6BcUo9O10fcdLe9VMSL/CIYuI3vcG5x6Q/G9k=
X-Gm-Gg: AYBFou1ePLYymi0Uj0LxnorIZ/epDIW2C0aGfKbRrRpgaB8n2OIZJodil0jjKvh8Hh7
	S/L5XvlKvayjffqBHNhfIo6EYo0cc0jV/DdQ74WzcJzuhzcazruuT9GzvgyQDuaVmWARCOdOmtL
	0rriTVwnTbJcKnvoqFuozLFOydMICA/M1/Eb8VLu2e6UBQZ46IqoLwajSqd8ALiokyOQOgzwmEE
	wVjBicNKZYuLGhhnlBZc8F4mGFgMpfCzTyOcA5azF8oZXjtirSo459EngTiP/0nskcihSHuw0sY
	SSiU8THW7HfcPheUduVvhyXm5xp1wCTvEDklc1B5W4adlNSIvHSGC86lL2iTCUySleVlFyM8jGu
	0W+DgPo9pngXlUZ8tz9bPoWFaWFuCz9jJntMVkVipBoapcCppNVGnjnEw+1YMHq26lHiB81IU9h
	BcC5InXx45hlcRIr3T5GbMbcFht2EKPDgtK8BeUgO92YDm3nUK8vs+bzV5IVWeqnQ=
X-Received: by 2002:a17:90b:3890:b0:3ac:a203:e0a5 with SMTP id 98e67ed59e1d1-3b0db6bbabdmr1594473a91.11.1793945281641;
        Thu, 05 Nov 2026 22:08:01 -0800 (PST)
X-Received: by 2002:a17:90b:3890:b0:3ac:a203:e0a5 with SMTP id 98e67ed59e1d1-3b0db6bbabdmr1594437a91.11.1793945281137;
        Thu, 05 Nov 2026 22:08:01 -0800 (PST)
Received: from [10.50.53.195] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323a1fdsm6342907a91.5.2026.11.05.22.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 22:08:00 -0800 (PST)
Message-ID: <1cb6d902-73f3-4d65-96f4-4b3c5217253c@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 11:37:55 +0530
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
Content-Language: en-US
To: Lee Jones <lee@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: [BUG] qcom-spmi-adc-tm5: lockdep reports invalid wait context in IRQ
 handler
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FSNGUSlHg7IV8YTQcUVwjArd8kln7m13
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyNCBTYWx0ZWRfX7d7RG5F1xYeY
 AiYHhNKcCrNdenUxplHGpZAQ9LWlIiI+CjSMFE9uMlObEbMcZZ3Aovwr76yHzep5sAAaHbIcz4c
 5E+ToRwARzerJVWI4uLjZ1pdYJ/fkPn/WJZKSzV/s4bIZeNDht6SeurjhApVyUUMLxeDC6kU9fN
 lL14vy7XWg8Eh1BTjjG44McW6BnWdh91BLeh1CHph5LeoMExjcjnoKQSnl7r9TGsM0j7M8mUzV1
 f0uPEaSuNdcHuPxjgRrBQTmUuOoFxyvgIHxvPB5+AbJMl9jOhqubqXZAJ/SZ120j8l8PVc2agZI
 x/c1nhcHbYVUTqQTVTMFv3ssZZ/MIVpYT1aXHnwgMiUf/B5v31vnW8NywX9gibHI6NvG7rX6du2
 pCwuVARbERRXfxN3Rm6cbyK+qrReNM5JtTZpGdRxYoR//0f0nOGjCsm9BdYawn1r8nzk76zwob3
 b/4SXrCdWCUSRZL5e2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyNCBTYWx0ZWRfXySs6HryToYxX
 Bbz30gXCGbj7bEfYBIfoM/9udW7mTRY81wCAim59uutkrJTD9rXDkTm7BY3SHbJe/OvCoounMaj
 oAZ+emKYg5jmUspdWgduh2rrUy+JxGk=
X-Proofpoint-ORIG-GUID: FSNGUSlHg7IV8YTQcUVwjArd8kln7m13
X-Authority-Analysis: v=2.4 cv=CaKdd7rl c=1 sm=1 tr=0 ts=6aed6ec2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=-h-ZKOrKgG6alCjGbVIA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060024

Hello,

I am seeing the following lockdep warning on Linux v7.4-rc1 when
CONFIG_PROVE_LOCKING is enabled. I can reproduce it on a Qualcomm Glymur
CRD and so far I have only observed from v7.4-rc1 and only when
CONFIG_PROVE_LOCKING is enabled.

The warning is triggered from the Qualcomm SPMI ADC TM5 Gen3 interrupt
path while adc5_gen3_read() performs a regmap read:

swapper/0/0 is trying to lock:
ffff000b67201018
(qcom_spmi_pmic:259:(&spmi_regmap_config)->lock){....}-{3:3}, at:
regmap_lock_spinlock+0x20/0x40
other info that might help us debug this:
context-{2:2}
locks held by swapper/0/0: 0, last CPU#0
stack backtrace:

CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.4.0-rc1 #1 PREEMPT(full)

Call trace:
check_wait_context.isra.0+0x2d8/0x380
__lock_acquire+0x2ec/0x840
lock_acquire.part.0+0xe0/0x250
lock_acquire+0x8c/0x1e0
_raw_spin_lock_irqsave+0x6c/0xd8
regmap_lock_spinlock+0x20/0x40
regmap_raw_read+0x88/0x328
regmap_bulk_read+0x10c/0x340
adc5_gen3_read+0x38/0x50 [qcom_spmi_adc5_gen3]
adctm5_gen3_isr+0x90/0x130 [qcom_spmi_adc_tm5_gen3]

There is also an ADC timeout around the same time:

qcom-spmi-adc5-gen3 c42d000.spmi:pmic@0:adc@9000:
Reading ADC channel pm8550_gpio_02 timed out

Kernel/platform details:

Kernel: 7.4.0-rc1 #1, PREEMPT(full), not tainted
Platform: Qualcomm Glymur CRD
Firmware: 6.0.260410.BOOT.MXF.2.4-00601-HAMOA-1 (04/10/2026)
Config: CONFIG_PROVE_LOCKING=y

The full backtrace is:

[   12.924146] 7.4.0-rc1 #1 Not tainted
[   12.927848] -----------------------------
[   12.931982] swapper/0/0 is trying to lock:
[   12.936217] ffff000b67201018
(qcom_spmi_pmic:259:(&spmi_regmap_config)->lock){....}-{3:3}, at:
regmap_lock_spinlock+0x20/0x40
[   12.947855] other info that might help us debug this:
[   12.953060] context-{2:2}
[   12.955773] locks held by swapper/0/0: 0, last CPU#0
[   12.960896] stack backtrace:
[   12.963889] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
7.4.0-rc1 #1 PREEMPT(full)
[   12.972208] Hardware name: Qualcomm CRD, BIOS
6.0.260410.BOOT.MXF.2.4-00601-HAMOA-1 04/10/2026
[   12.981070] Call trace:
[   12.983606] show_stack+0x20/0x38 (C)
[   12.987398] dump_stack_lvl+0x7c/0xb0
[   12.991180] dump_stack+0x18/0x24
[   12.994610] check_wait_context.isra.0+0x2d8/0x380
[   12.999552] __lock_acquire+0x2ec/0x840
[   13.003514] lock_acquire.part.0+0xe0/0x250
[   13.007837] lock_acquire+0x8c/0x1e0
[   13.011530] _raw_spin_lock_irqsave+0x6c/0xd8
[   13.013256] qcom-spmi-adc5-gen3 c42d000.spmi:pmic@0:adc@9000: Reading
ADC channel pm8550_gpio_02 timed out
[   13.025949] regmap_lock_spinlock+0x20/0x40
[   13.030264] regmap_raw_read+0x88/0x328
[   13.034227] regmap_bulk_read+0x10c/0x340
[   13.038368] adc5_gen3_read+0x38/0x50 [qcom_spmi_adc5_gen3]
[   13.044118] adctm5_gen3_isr+0x90/0x130 [qcom_spmi_adc_tm5_gen3]
[   13.050313] __handle_irq_event_percpu+0xac/0x4c8
[   13.055170] handle_irq_event+0x54/0x120
[   13.059218] handle_edge_irq+0x104/0x1d0
[   13.063272] handle_irq_desc+0x3c/0x68
[   13.067152] generic_handle_irq+0x28/0x40
[   13.071289] periph_interrupt+0xe8/0x1c0
[   13.075353] pmic_arb_chained_irq+0x148/0x380
[   13.079860] handle_irq_desc+0x3c/0x68
[   13.083730] generic_handle_domain_irq+0x20/0x40
[   13.088503] __gic_handle_irq.isra.0+0x58/0x108
[   13.093179] gic_handle_irq+0x1c/0x40
[   13.096976] call_on_irq_stack+0x30/0x48
[   13.101024] do_interrupt_handler+0x88/0x98
[   13.105342] el1_interrupt+0x3c/0x60
[   13.109035] el1h_64_irq_handler+0x18/0x30
[   13.113268] el1h_64_irq+0x78/0x80
[   13.116791] cpuidle_enter_state+0x13c/0xa10 (P)
[   13.121552] cpuidle_enter+0x40/0x60
[   13.125251] cpuidle_idle_call+0x184/0x270
[   13.129483] do_idle+0xac/0x150
[   13.132729] cpu_startup_entry+0x40/0x58
[   13.136786] rest_init+0x214/0x220
[   13.140309] start_kernel+0x4c4/0x4d0
[   13.144097] __primary_switched+0x88/0x98

Please let me know if additional logs, the kernel config, or testing of
a proposed fix would be useful.

Thanks,
Pankaj
