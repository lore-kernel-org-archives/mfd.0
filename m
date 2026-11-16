Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815302;
	b=GZ9bQbAbEKzqhPzv1s7OkIc1OIaZ7Nqh1HBcgNW2W9iS1qeadLyGGlUzO+9xIuG9pRET
	 eGvt1xNVGeHUVg+x9Dvy/gaHEIIgOThdewgoRNamT8zSfTP/Kk32eTFXeEcluWUPveLr1
	 Xiec9WPkc4eBWi1Qjx8gVgb5VOeQCeggSZVyX7sz0kv46b6ysgk34L8lxvLGidUA500ed
	 DBK/55DXePk/X0dygGF5fQJSJlL4C7nlLMmIFe8CMIVbG1VNfbaEnk/iEsJa9+IBqwPtw
	 RAXcJh3kIPiqkY0vfxeGNvPLmaM/+Rya9JH3K6hlSIG+K0qVp5jPFLQxDIM7NNp3W1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815302;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IGNFYATSTRk0m4sDibX1E1epOFieqLBD3Mxm7XMYiAo=;
	b=fIktoLO9WHB7HoZ1F73oj2I6wH650dWaFbflbUyz1YOYy1+/YlGT+tPLLRxtATmnQGYU
	 DVrWRtFayIluhAxhUoPTak3TdaErhKT7f2jZKghnEU//JvDYMk6tlLLPaCxRwj22YKW+e
	 l3wXwfnb5OZj5V2cmIRybG3ZZVk3PJFI1pupaQ6U8xJeFlB+58O2M8GzX+70SFOuslWQ5
	 uJ5m9wP0MRK028fwTpc1FSeSKmcR73fCv6miCbtndOcSxM2ohDkfaf/i5B1Zi3Ssfi0v+
	 OpaLkh6dDG+K0Z5KpxKVNfwqI215yKhB7JLajzKNUejHUJZGNMBRjQ4V4tKM+Q2GRtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fkM10zgx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DNGvXn0e;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBA2606A329
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 07:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CBA2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fkM10zgx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DNGvXn0e
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7eoCq1109792
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 07:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGNFYATSTRk0m4sDibX1E1epOFieqLBD3Mxm7XMYiAo=; b=fkM10zgxBcivPLtZ
	wRyCEo6iKmL35cEIZXHB1ARHguiqNFBWF1bsYdASwHb5PiS+bgacwG1gXaFq6//1
	kcq6kvbPZrTbtkWGId2MQyBGYE4N6xR28eQaQyUIlvQIJoq52tjwOH+qEISkVb7x
	gOnWkHFxvKe0i2WpgvgqAr3uCl5/DbV5BGusp4MEPGBKGe5IsFexLeCMuS37OOWw
	IFv6oiPCftpvZj9v/QaYS70oe+d4Tk0yyw7y4CMgeIWj8SISH7WqPr9PDHrgMHbe
	3ksEHTxtoGhZXyY/XinY34nDP1vXoqFRZK792U7cO6VWSpzHEe1S+NIH1c7pSUcz
	m9xH6w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc13x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 07:48:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b60129a46eso4167022b3a.1
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 23:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794815301; x=1795420101; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGNFYATSTRk0m4sDibX1E1epOFieqLBD3Mxm7XMYiAo=;
        b=DNGvXn0eIQEcjfo0Y68ySGr3tddqXYPh8GZjC1YaOnODEDHsBlY28xVq37lltxdQ1S
         vQGD/9tYYdaYVhB7zcqcO/Xs3qkTrrTwIIhHs9cibecQk3I8crCXTRG1hNABC0sJAKDS
         WZ+dItamiFW30R8hBcbDPi99p9KUt5F10riBUtZQu86+ViIlyYKDoE1wQBb6lPmC38yv
         rT1RbCmIHedg/JorWJY1ghJz11N/5+XrJQlyQHVDSQpFIDaw99zpuObic1WkAhNfTKG2
         /te/iSNgBvTkE5u9u/daLBTA2AWMuLAO7tl4LB+jED+iikuUCbrXhiIxKpOj7mzovy7i
         fpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815301; x=1795420101;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGNFYATSTRk0m4sDibX1E1epOFieqLBD3Mxm7XMYiAo=;
        b=1v4dQknQ0+oNsy7LFVedkeLeA+yQmYJKoJkPK+97UWYPHGEf0hguDglo+dS18WKk8n
         lkkcRugSjT10VVwUSMAxu07Mk9p8zYNaQxMoWx2we/UQ7Y9Nu25lohEO5MfHHQ7CiylW
         gIajySMk9w1zoj0InBi7z4behPhZlAtpA0tp41OpgH3e4vgLIpwDnnu//IsPfWSF4OiN
         uCkEMn6wQaUmYAur1Idbdnu3t2cT/CIV1U+BA2OE1+XOE+u6EypYLXQvF1QBVBFx5GhL
         La40VSRgxWX7WPXaLBPHKgpFwxoswWO3az7aFOU6MVO71FIHT7UAg2bu/+4f5dT9Fy/i
         WddQ==
X-Gm-Message-State: APuU4Z8HQ56ILAh0oWrtlXZ0XJPel6Ol3cDFx+7oQjyTYCz57puyg+Uy
	QNTYbNkRrOjSJ6NlZdvgeXTFr9DbqQahpHkh5g4hQGAwgbIKj2uISpxXUJLm24ZC2qpa2bzGFLh
	dS+mWOEEA7IiYPwDfJFmgQ575kaolKYt2DkM5ofCGgwiBgcab2xVzMZY=
X-Gm-Gg: AYBFou2f/wa8R3e0wMLVAVKW/xDaudjl/JdzURtRumlz9mxljCBjw5FzMUBP+RCaA1P
	AQPo4ov0vwb6RcNAnLXCICV4xE8yqLQNG2c67cfiTlWMVsv+2niARYxSyXYjajhJXOkR0eE/74z
	FEMI1XPYNZZLpAJzIWIfEwVXtWlknhFwTjYfNUu4BwUTmPKyrPhCDXSs6Y6OPCXiNfMxUuMzjOm
	lRfdilkAvYakku+W/+pE6/sLEqvVn6ofUxzlZdk01b5tObANSQ4iZu0iIvZ918qrOnrBDSN2dod
	c3tp2FtLVOAC57kWKh2eLyqFGmQdlotRmxYGiYQUkvdtIzsO5mhx7yn2P9m7P+/Wps2vaF96Rv8
	dxDXTGqQ+BLOjxZKHQOR+Ymg/LR7otOd2PM1CKcrAS7NTy2u7UDCOBO2kbsS1yrsb0t/KzQt2m1
	A/a9A=
X-Received: by 2002:a05:6a00:4f90:b0:886:3827:c4a2 with SMTP id d2e1a72fcca58-8beb20cec9fmr9592569b3a.3.1794815300547;
        Sun, 15 Nov 2026 23:48:20 -0800 (PST)
X-Received: by 2002:a05:6a00:4f90:b0:886:3827:c4a2 with SMTP id d2e1a72fcca58-8beb20cec9fmr9592541b3a.3.1794815299983;
        Sun, 15 Nov 2026 23:48:19 -0800 (PST)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed243e643sm3450597b3a.42.2026.11.15.23.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:48:19 -0800 (PST)
Message-ID: <8abf16ac-7906-4ff6-ba4c-4e3f2c00b214@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 13:18:15 +0530
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
Subject: Re: [BUG] qcom-spmi-adc-tm5: lockdep reports invalid wait context in
 IRQ handler
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Lee Jones
 <lee@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <1cb6d902-73f3-4d65-96f4-4b3c5217253c@oss.qualcomm.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <1cb6d902-73f3-4d65-96f4-4b3c5217253c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX09VcjG8WLGpr
 fiblr1BSIvQrye+6Mwm1G3RMdLxjvtFq1o4h7NQslsT9qTW7wwW4rd3MFqoBGvsG2AbGY+v4yBu
 jrfUnmJurrMkzG94CwUsJXpuPTQEHIs=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afab545 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=j9aXnjOe7kIp99Lnl9cA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: jVnnKTS-A3p_T5uC4zsUUx_77Ztqp4pV
X-Proofpoint-GUID: jVnnKTS-A3p_T5uC4zsUUx_77Ztqp4pV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX2Bw/cNTA5n3p
 HtK+Yv8k4gIYmAUQubRutvajwXWN9pDZPgB43Gr/RBCEuthoYivQpOAwdOTerx+cFEN4RL9/s6p
 YZiduDkoiMXAzjxQbmxk/zy+L4qQg5vn1qjg62qEqaq5hFvovVyN/QjEqmB7ls4KvZo1bFOtoSG
 Z6q1dJKrayuOHxY4icyYPI3ErS2sZTZ54j6tfb5GetWhZDGRNhjR80z6jRDuCwJqsOKt9VtqnxK
 E6zRprH5Hg2Oao/lWNMi/1uno/oTmVFQ+Miml7DLnSxDwGu2HpLDkp48gWIkFnFTx1q+h2IMOB1
 /8KVHPuqQ1jLSdw0pbbYFBGQf9HTVNx/cltqVSOvKK5LRgtUz7kf1VKjzJ0Wl75nYYMF439EYEx
 WwmJ3gIG6gX95sKSFW4ya9+headNZJOGuTlqeGkGTfU6F7oQ77i9NRSYFOVFkq+PZqS5Z4lsB3M
 NgQR6ZUTALSG46avWuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160030

Hi Pankaj,

On 11/6/2026 11:37 AM, Pankaj Patil wrote:
> Hello,
> 
> I am seeing the following lockdep warning on Linux v7.4-rc1 when
> CONFIG_PROVE_LOCKING is enabled. I can reproduce it on a Qualcomm Glymur
> CRD and so far I have only observed from v7.4-rc1 and only when
> CONFIG_PROVE_LOCKING is enabled.
> 
> The warning is triggered from the Qualcomm SPMI ADC TM5 Gen3 interrupt
> path while adc5_gen3_read() performs a regmap read:
> 

I have pushed a fix for this lock warning here:
https://lore.kernel.org/all/20261113-adctm5_gen3_hardirq_removal-v2-1-a0c9c4800941@oss.qualcomm.com/.

The issue happens due to taking a spinlock in a regmap read during the
primary IRQ handler. The fix moves all the actions of the primary handler
into the threaded handler as having a separate primary hardirq handler
is not strictly necessary.

Thanks,
Jishnu

> swapper/0/0 is trying to lock:
> ffff000b67201018
> (qcom_spmi_pmic:259:(&spmi_regmap_config)->lock){....}-{3:3}, at:
> regmap_lock_spinlock+0x20/0x40
> other info that might help us debug this:
> context-{2:2}
> locks held by swapper/0/0: 0, last CPU#0
> stack backtrace:
> 
> CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.4.0-rc1 #1 PREEMPT(full)
> 
> Call trace:
> check_wait_context.isra.0+0x2d8/0x380
> __lock_acquire+0x2ec/0x840
> lock_acquire.part.0+0xe0/0x250
> lock_acquire+0x8c/0x1e0
> _raw_spin_lock_irqsave+0x6c/0xd8
> regmap_lock_spinlock+0x20/0x40
> regmap_raw_read+0x88/0x328
> regmap_bulk_read+0x10c/0x340
> adc5_gen3_read+0x38/0x50 [qcom_spmi_adc5_gen3]
> adctm5_gen3_isr+0x90/0x130 [qcom_spmi_adc_tm5_gen3]
> 
> There is also an ADC timeout around the same time:
> 
> qcom-spmi-adc5-gen3 c42d000.spmi:pmic@0:adc@9000:
> Reading ADC channel pm8550_gpio_02 timed out
> 
> Kernel/platform details:
> 
> Kernel: 7.4.0-rc1 #1, PREEMPT(full), not tainted
> Platform: Qualcomm Glymur CRD
> Firmware: 6.0.260410.BOOT.MXF.2.4-00601-HAMOA-1 (04/10/2026)
> Config: CONFIG_PROVE_LOCKING=y
> 
> The full backtrace is:
> 
> [   12.924146] 7.4.0-rc1 #1 Not tainted
> [   12.927848] -----------------------------
> [   12.931982] swapper/0/0 is trying to lock:
> [   12.936217] ffff000b67201018
> (qcom_spmi_pmic:259:(&spmi_regmap_config)->lock){....}-{3:3}, at:
> regmap_lock_spinlock+0x20/0x40
> [   12.947855] other info that might help us debug this:
> [   12.953060] context-{2:2}
> [   12.955773] locks held by swapper/0/0: 0, last CPU#0
> [   12.960896] stack backtrace:
> [   12.963889] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
> 7.4.0-rc1 #1 PREEMPT(full)
> [   12.972208] Hardware name: Qualcomm CRD, BIOS
> 6.0.260410.BOOT.MXF.2.4-00601-HAMOA-1 04/10/2026
> [   12.981070] Call trace:
> [   12.983606] show_stack+0x20/0x38 (C)
> [   12.987398] dump_stack_lvl+0x7c/0xb0
> [   12.991180] dump_stack+0x18/0x24
> [   12.994610] check_wait_context.isra.0+0x2d8/0x380
> [   12.999552] __lock_acquire+0x2ec/0x840
> [   13.003514] lock_acquire.part.0+0xe0/0x250
> [   13.007837] lock_acquire+0x8c/0x1e0
> [   13.011530] _raw_spin_lock_irqsave+0x6c/0xd8
> [   13.013256] qcom-spmi-adc5-gen3 c42d000.spmi:pmic@0:adc@9000: Reading
> ADC channel pm8550_gpio_02 timed out
> [   13.025949] regmap_lock_spinlock+0x20/0x40
> [   13.030264] regmap_raw_read+0x88/0x328
> [   13.034227] regmap_bulk_read+0x10c/0x340
> [   13.038368] adc5_gen3_read+0x38/0x50 [qcom_spmi_adc5_gen3]
> [   13.044118] adctm5_gen3_isr+0x90/0x130 [qcom_spmi_adc_tm5_gen3]
> [   13.050313] __handle_irq_event_percpu+0xac/0x4c8
> [   13.055170] handle_irq_event+0x54/0x120
> [   13.059218] handle_edge_irq+0x104/0x1d0
> [   13.063272] handle_irq_desc+0x3c/0x68
> [   13.067152] generic_handle_irq+0x28/0x40
> [   13.071289] periph_interrupt+0xe8/0x1c0
> [   13.075353] pmic_arb_chained_irq+0x148/0x380
> [   13.079860] handle_irq_desc+0x3c/0x68
> [   13.083730] generic_handle_domain_irq+0x20/0x40
> [   13.088503] __gic_handle_irq.isra.0+0x58/0x108
> [   13.093179] gic_handle_irq+0x1c/0x40
> [   13.096976] call_on_irq_stack+0x30/0x48
> [   13.101024] do_interrupt_handler+0x88/0x98
> [   13.105342] el1_interrupt+0x3c/0x60
> [   13.109035] el1h_64_irq_handler+0x18/0x30
> [   13.113268] el1h_64_irq+0x78/0x80
> [   13.116791] cpuidle_enter_state+0x13c/0xa10 (P)
> [   13.121552] cpuidle_enter+0x40/0x60
> [   13.125251] cpuidle_idle_call+0x184/0x270
> [   13.129483] do_idle+0xac/0x150
> [   13.132729] cpu_startup_entry+0x40/0x58
> [   13.136786] rest_init+0x214/0x220
> [   13.140309] start_kernel+0x4c4/0x4d0
> [   13.144097] __primary_switched+0x88/0x98
> 
> Please let me know if additional logs, the kernel config, or testing of
> a proposed fix would be useful.
> 
> Thanks,
> Pankaj

