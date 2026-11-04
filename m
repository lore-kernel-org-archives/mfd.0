Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797131;
	b=AhekKRdZ6zQWT0I3ycols0ZECbOk/YL1x2RKqF+s7WzcKJ0DTP9Hf6vG6RQZPepgVUhw
	 MbOjjwCVAE1h950Vpa3eFXNCHipHH02yOmGY2eppcnxS9+cz4uZl5IGXybgYtgn7yLG1S
	 Sez/pIPuvTfOA1UOnQx8CkEvELYFcG8XlXPQ+NV/8PCty+UNGjhjE1mnR2GCVYK+cZPl4
	 40lnaH7EdUJewkOtUDlGCWjVL8bUXv69Dvt8TrUiZJuR9X08+nQNyOlKNpd6m2WM3RoYQ
	 KC+Wjj58zRRAFI8sqPJA6CT51TrarQr0UqHUX6XAm4Na5e+QwsmmvlIcgGNXM01E3XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797131;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mwCkDJFZoqbMqAzqKG3ZXny/3GlMXYpZIR38ZotC6Sg=;
	b=diU+Hkt6JgzKczOFaWm0FmmRUfM1TVhQpW6ku0TjYeJYHmI77uUkqVP8SocEl/kg1ZTi
	 rSryn+tsqzXT3Cxg+P4LzenIqUTsCZAUfycVEN+9vaeNPxA5KYaMkN5+B9ybgBF8ffEYc
	 UmylSm25YP+n2NATdjR/zZ6TT7k6y21kkVonQBLhWZO9w6TvdRhzSvtBU9w3RrELWhFjO
	 nn6jAri4kSK8bMyX+JoiTrnJy5eLjyKlIuo802LPEeMShgveZGfAj+hBb1zOa8Kr9kCXS
	 FPTzxM6j38evNuiZQWWIeZf08Ywr/YWhxjllNMb7ODwXNANbPJSMK1e2hIKHguW17sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Xb/La5K9";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aUB471fL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B512A606A331
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 12:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B512A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xb/La5K9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aUB471fL
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Bo0pe1387576
	for <mfd@lists.linux.dev>; Wed, 4 Nov 2026 12:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mwCkDJFZoqbMqAzqKG3ZXny/3GlMXYpZIR38ZotC6Sg=; b=Xb/La5K9VRfyMjN1
	l7kZO6beSCpdVW9c/ew1qWg0Cjf04luSSFcjwu/QNYkQp9e3ALipseJZbOnUagrR
	eBygU3PewFnQQoQnlo2weRELRBbJ45X7Y2HCe+BpPQsbojjKBJSTboH7IfkVnQ1G
	n6qDMR3q0nAxMmQQYITZ0WrTe5wXlACsMNCNOA2kEJpNxBhinXF3ERtfg9yotx/y
	gozlVMenv9/DI+BZs72JYuLDRAlxpHzGhDLdUZtJhKYCkOllqpg6+46gqBvAl5hy
	9uppMgDB4YM0RP6On0mvJAZzvOAnJ8JbR5khpC1G6V5iLjVDXcCQsCc5oH8h29K2
	VZfnKw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsga69x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 12:58:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b1ae61c87aso1040b3a.2
        for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 04:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793797128; x=1794401928; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwCkDJFZoqbMqAzqKG3ZXny/3GlMXYpZIR38ZotC6Sg=;
        b=aUB471fLcrpq9oO8vOQ5OcowCXAAVblORXzrCtpqwLfT2kpoPX7kadtudx8UmeAXFf
         SHd/q7yAaHfziGoLb99Bf12geK7UjDtLiLYYJ4p53d+va+OOcSqVDnBJikYAn4kvcoxu
         WaEkGJOsTwOEr+qjHl4T+G664pxv4TAPoqcSga1fGl0XovZ3VbR9JRcryeH1f5DI9H+a
         BvvYRVyr6EtZpEw1JmiL2aifzJkJhVjGUJZi4ouLWxryz/9gYYzzBLUJWhFA81EFdaS3
         q3LkadEehb9E4nsjX3Hrgn5Nkwvadq9FOow3L2uhKElN2SwlHTMHY43a0CHbRik+nUio
         DD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793797128; x=1794401928;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwCkDJFZoqbMqAzqKG3ZXny/3GlMXYpZIR38ZotC6Sg=;
        b=OXUgij8U5m6Bl7UyjEFHDa57ZB0lmYKxxohc5vWGNXq4wCbTKOEwq9JF7Nvf0UGMA0
         nc/32Y7sjiGjnuNytYjzdDB2H1ljTCF/r/fwhRZT4sTstVd5c8aoezssrjQCZZPk9BAb
         x65YUYaw4CjabdzAc39lSYX9uDvXnT6RJ6IZguILkpS/Zd/Ef9jL4IkI6APlK6ib+OeV
         hAufNa+09/TCZCZmXqaJA/mJKPbtNyghobJKCsHBH/hkGqRjnVn6V6P4UZXruf05r9/X
         ac7hXzEpl08A34JtM6IuTTEPg6N8AbE2txiBepwTGoka5fIS0z6i5Xbfb/sMK7qB72V1
         uXkg==
X-Forwarded-Encrypted: i=1; AKwUvBy40LEjvqFJNqcYpIK1/2+oc70w8oA7L0o34yx/3CTBuqJ6ZnA/BTnPPxCjBtzed6nKVxI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8bH+fLOsuc3cMoFaT3dxfIziZCcnee79FrHGB4XlITXl6SRoPd
	cUCsGjcNIFCZnEfVB4RecoftSreTdwDc1+yiAwiK9tHRQ7z8uQETH7MwEL5eBIpzLtiTHQG8lpq
	5fzjVO8pC9PHMwK4BwpnMdPWSex5j0hNADqUoeZXfVJOsBxYfkvcRIE4=
X-Gm-Gg: AYBFou1GG7ruoJx0WdcpUR8u51AK7qxPZrxP3cXT1fgbhe46W+yXa/CUUzqNWfUdgS0
	+LRj8BfV+sxWlUmXahH5MPmK9ROb3+wBd/s6L1Yj8poh7fyg9eISCjYCj0NueVay0no8Ob2TZBK
	7Xu/keb+C0NTLRnCKdVfnyKUyiEM1Xta86Q6WIbDn+hvTreEwOFi+TWalu0gHzQEi2sssBJq8aM
	Qj0VlI761NZuPIk93xhLZ3sjrrYqyNKBvO93g+0VBFbl5/z8iNrKfil9y2s1kMG98+00QqpLdgK
	rvdHd7ERae/604DP+JieMslzPyg4ySQr82Nog/0z1d+4sfLEfq1sDWraQOIZ7aFofZqhVcG1Ued
	keLBCsm/CTCpmPc0CHlE67aQlcLWQP7VhOqJPGFKPhKTr9DKxoIJ6Pm+Il+wnLLQbwbAG06bJth
	1Xm2/LbA==
X-Received: by 2002:a05:6a20:a124:b0:3e1:e53b:5005 with SMTP id adf61e73a8af0-3e92901056dmr16655514637.65.1793797128330;
        Wed, 04 Nov 2026 04:58:48 -0800 (PST)
X-Received: by 2002:a05:6a20:a124:b0:3e1:e53b:5005 with SMTP id adf61e73a8af0-3e92901056dmr16655474637.65.1793797127680;
        Wed, 04 Nov 2026 04:58:47 -0800 (PST)
Received: from [10.92.198.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb469b1f96sm1055018a12.30.2026.11.04.04.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:58:46 -0800 (PST)
Message-ID: <784834c9-034b-42e5-98b2-8660180dd6fe@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 18:28:38 +0530
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
Subject: Re: [PATCH v4 02/12] hwmon: Add Qualcomm PMIC BCL driver
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
 <5598422c-8830-4fcf-be2b-e4486ea64539@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <5598422c-8830-4fcf-be2b-e4486ea64539@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeb2c09 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Eqzg2zcYyYqNIvlFOjsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: Z07v56gFoC58MXCgM9_DAkj3bqimDzUi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MSBTYWx0ZWRfX31/wMxMEQ1Ze
 o42sm6N+YMbO3rdgnCvcjnzjhT4D18KY7/ZLhXWPMTNPV8PmOhfHnUnF2L50u6sMawdd6s0RXz+
 xtx8UyUeVVQRRfB/thXpwfApDKZvsXwR7MNNWoMfzSJs13moFi7NPsZ2f9467Pf7yDQ/TPcG7cM
 /lo0JcJZEx+RBC/1iGFSOgJpT5HKw8ZM3pWwyIsShETlVserqlZhxR4ABr9ocWoxG484+ROmes4
 kNCJ0ROCX/ql7lmY94N+AsHfdF9q0SbuH4neUDfSgcRFeUQeuunFJ7V5II/ys0D5n9s4jMBAJKP
 83s7KO4RMFATm0+ojqOzFdcbJAHA9FMPsSI4nDR+Yfpg7gYM12+8/vwOoEmr4aJWlg23maqfOC9
 fA13GKMDDOvSJ8C5my58gE0Kdb7OsPP636Bc6HXjBtePRDi4508nZxistEwsMIXP940h5pFszsG
 hMyJcM0Fu+pV0wJp97A==
X-Proofpoint-GUID: Z07v56gFoC58MXCgM9_DAkj3bqimDzUi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MSBTYWx0ZWRfXxyq8ldcmbWqx
 4A+jKcs7MpGpild9hXgJ4LfFKW8j1cCIpYL2rf1gC8fdyhFEFz2ercGE2qUlTK6sN9zjFXxVPGU
 8qUWyBXcZJw6fNraZhLO5zFqDe0I1mE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040051

Hi Daniel,

On 10/27/2026 4:51 PM, Daniel Lezcano wrote:
> 
> Hi Manaf,
> 
> On 10/5/26 14:24, Manaf Meethalavalappu Pallikunhi wrote:
>> Add driver for Qualcomm SPMI PMIC Battery Current Limiting (BCL)
>> hardware monitor. The driver exposes battery voltage and current
>> monitoring through hwmon interface.
>>
>> The BCL driver provides
>> - Real-time voltage and current readings
>> - Configurable threshold-based alarms
>> - Interrupt-driven notifications when thresholds are exceeded
>> - Automatic threshold management with polling-based recovery
>> - Hardware-specific scaling factors and threshold representations
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi 
>> <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> 
> There are a couple of issues in sashiko related to this patch (devres 
> LIFO issue and 6 bits encoding value too short for the represented value).

will check and update in next revision

> 
> [ ... ]
> 
>> +/**
>> + * struct bcl_channel_cfg - BCL channel related configuration
>> + * @default_scale_nu:  Default scaling factor in nano unit
>> + * @base_mu: Base threshold value in milli unit
>> + * @max_mu: Maximum threshold value in milli unit
>> + * @step_mu: step increment value between two indexed threshold value 
>> in milli unit
>> + * @thresh_type: Array specifying threshold representation type for 
>> each alarm level
>> + *
>> + * Contains hardware-specific configuration and scaling parameters 
>> for different
>> + * channels (voltage and current).
>> + */
>> +struct bcl_channel_cfg {
>> +    u32 default_scale_nu;
>> +    u32 base_mu;
>> +    u32 max_mu;
>> +    u32 step_mu;
>> +    u8 thresh_type[BCL_LIMIT_ALARM_MAX];
>> +};
>> +
>> +/**
>> + * struct bcl_desc - BCL device descriptor
>> + * @reg_fields: Array of register field definitions for this device 
>> variant
>> + * @channel_cfg: Array of channel configurations indexed by battery 
>> config
>> + *               PMICs without battery detection: only [BCL_BATT_1S] 
>> is defined
>> + *               PMICs with battery detection: [BCL_BATT_2S], 
>> [BCL_BATT_3S]
>> + * @battery_config_field: Register field for battery configuration 
>> detection
>> + *                        NOTE: This is an ABSOLUTE address, not 
>> relative to BCL base
>> + *                        Set to REG_FIELD(0, 0, 0) if not used
>> + * @num_reg_fields: Number of register field definitions for this 
>> device variant
>> + * @data_field_bits_size: data read register bit size
>> + * @thresh_field_bits_size: lsb bit size those are not included in 
>> threshold register
>> + * @in_mon_enabled: Voltage monitoring enabled at boot
>> + * @in_input_enabled: Voltage input reading enabled at boot
>> + * @curr_mon_enabled: Current monitoring enabled at boot
>> + *
>> + * Contains hardware-specific configuration and scaling parameters 
>> for different
>> + * BCL variants. Each PMIC model may have different register layouts and
>> + * conversion factors.
>> + */
>> +struct bcl_desc {
>> +    const struct reg_field *reg_fields;
>> +    struct bcl_channel_cfg channel_cfg[BCL_BATT_3S + 1][CHANNEL_MAX];
>> +    const struct reg_field battery_config_field;
>> +    u8 num_reg_fields;
>> +    u8 data_field_bits_size;
>> +    u8 thresh_field_bits_size;
>> +    bool in_mon_enabled;
>> +    bool in_input_enabled;
>> +    bool curr_mon_enabled;
>> +};
> 
> It is your call but I suggest to use a single variable:
> 
> eg. u8 features
> 
> and use masks
> 
>      features = IN_MON | IN_INPUT;
> 
> that will reduce the declaration size below.

ACK

> 
>> +/**
>> + * struct bcl_alarm_data - BCL alarm interrupt data
>> + * @irq: IRQ number assigned to this alarm
>> + * @irq_enabled: Flag indicating if IRQ is enabled
>> + * @irq_wake_enabled: Flag indicating if IRQ wake is enabled
>> + * @shutting_down: Flag preventing work from re-enabling IRQ during 
>> teardown
>> + * @type: Alarm level type (LVL0, or LVL1)
>> + * @device: Pointer to parent BCL device structure
>> + * @a_lock: Mutex for protecting alarm state
>> + * @alarm_poll_work: delayed_work to poll alarm status
>> + *
>> + * Stores interrupt-related information for each alarm threshold level.
>> + * Used by the IRQ handler to identify which alarm triggered.
>> + */
>> +struct bcl_alarm_data {
>> +    int            irq;
>> +    bool            irq_enabled;
>> +    bool            irq_wake_enabled;
>> +    bool            shutting_down;
> 
> Same suggestion

I wanted to keep these as separate bools. The shutting_down is accessed 
lock-free via READ_ONCE/WRITE_ONCE in the IRQ-handler fast path, while 
irq_enabled and irq_wake_enabled are accessed under a_lock using plain 
reads and writes. Packing them into one flags byte would make updates to 
the other flags read-modify-write operations on the same byte that the 
lock-free path reads with READ_ONCE.

> 
>> +    enum bcl_limit_alarm    type;
>> +    void            *device;
>> +    /* Protects alarm IRQ enable/disable state */
>> +    struct mutex        a_lock;
>> +    struct delayed_work    alarm_poll_work;
>> +};
>> +
>> +/**
>> + * struct bcl_device - Main BCL device structure
>> + * @dev: Pointer to device structure
>> + * @regmap: Regmap for accessing PMIC registers
>> + * @base: the BCL regbase offset from regmap
>> + * @fields: Array of regmap fields for register access
>> + * @bcl_alarms: Array of alarm data structures for each threshold level
>> + * @lock: Mutex for protecting concurrent hardware access
>> + * @last_in_input: Last valid voltage input reading in millivolts
>> + * @last_curr_input: Last valid current input reading in milliamps
>> + * @last_in_updated: Timestamp of last voltage input update
>> + * @last_curr_updated: Timestamp of last current input update
>> + * @desc: Pointer to device descriptor with hardware-specific parameters
>> + * @hwmon_dev: Pointer to registered hwmon device
>> + * @hwmon_name: Sanitized name for hwmon device
>> + * @batt_config: Detected battery configuration (only for SMB2360/2370)
>> + * @batt_config_regfield: Regmap field for battery configuration 
>> register
>> + *
>> + * Main driver structure containing all state and configuration for a 
>> BCL
>> + * monitoring instance. Manages voltage and current monitoring, 
>> thresholds,
>> + * and alarm handling.
>> + */
>> +struct bcl_device {
>> +    struct device        *dev;
>> +    struct regmap        *regmap;
>> +    u16            base;
>> +    struct regmap_field    *fields[F_MAX_FIELDS];
>> +    struct bcl_alarm_data    bcl_alarms[BCL_LIMIT_ALARM_MAX];
>> +    /* Protects hardware register access and device state */
>> +    struct mutex        lock;
>> +    u32            last_in_input;
>> +    s32            last_curr_input;
>> +    unsigned long        last_in_updated;
>> +    unsigned long        last_curr_updated;
>> +    const struct bcl_desc    *desc;
>> +    struct device        *hwmon_dev;
>> +    char            *hwmon_name;
>> +    enum bcl_battery_config    batt_config;
>> +    struct regmap_field    *batt_config_regfield;
>> +};
>> +
>> +static const u8 in_attr_to_lvl_map[] = {
>> +    [hwmon_in_min] = BCL_LIMIT_ALARM_LVL0,
>> +    [hwmon_in_lcrit] = BCL_LIMIT_ALARM_LVL1,
>> +    [hwmon_in_lemergency] = BCL_LIMIT_ALARM_LVL2,
>> +    [hwmon_in_min_alarm] = BCL_LIMIT_ALARM_LVL0,
>> +    [hwmon_in_lcrit_alarm] = BCL_LIMIT_ALARM_LVL1,
>> +    [hwmon_in_lemergency_alarm] = BCL_LIMIT_ALARM_LVL2,
>> +};
>> +
>> +static const u8 in_lvl_to_attr_map[BCL_LIMIT_ALARM_MAX] = {
>> +    [BCL_LIMIT_ALARM_LVL0] = hwmon_in_min_alarm,
>> +    [BCL_LIMIT_ALARM_LVL1] = hwmon_in_lcrit_alarm,
>> +    [BCL_LIMIT_ALARM_LVL2] = hwmon_in_lemergency_alarm,
>> +};
>> +
>> +static const u8 curr_attr_to_lvl_map[] = {
>> +    [hwmon_curr_max] = BCL_LIMIT_ALARM_LVL0,
>> +    [hwmon_curr_crit] = BCL_LIMIT_ALARM_LVL1,
>> +    [hwmon_curr_max_alarm] = BCL_LIMIT_ALARM_LVL0,
>> +    [hwmon_curr_crit_alarm] = BCL_LIMIT_ALARM_LVL1,
>> +    [hwmon_curr_emergency_alarm] = BCL_LIMIT_ALARM_LVL2,
>> +};
>> +
>> +static const u8 curr_lvl_to_attr_map[BCL_LIMIT_ALARM_MAX] = {
>> +    [BCL_LIMIT_ALARM_LVL0] = hwmon_curr_max_alarm,
>> +    [BCL_LIMIT_ALARM_LVL1] = hwmon_curr_crit_alarm,
>> +    [BCL_LIMIT_ALARM_LVL2] = hwmon_curr_emergency_alarm,
>> +};
>> +
>> +/* Interrupt names for each alarm level */
>> +static const char * const bcl_int_names[BCL_LIMIT_ALARM_MAX] = {
>> +    [BCL_LIMIT_ALARM_LVL0] = "max-min",
>> +    [BCL_LIMIT_ALARM_LVL1] = "critical",
>> +    [BCL_LIMIT_ALARM_LVL2] = "emergency",
>> +};
> 
> why not fold the structures into a single one?
> 
> eg.
> 
> struct attr_lvl_map {
>      const int level;
>      const int attr;
>      const char *name;
> };
> 
> const curr_attr_lvl_map[] = {
>      {
>        .level = BCL_LIMIT_ALARM_LVL0,
>        .attr = hwmon_curr_max_alarm,
>        .name = "max-min"
>      }
>      ...
> };
> 
> And a function lvl_to_attr() / attr_to_lvl()
> 
> ?
> 
> 
> [ ... ]

ACK

Thanks,
Manaf

> 
> Thanks
> 
>    -- Daniel

