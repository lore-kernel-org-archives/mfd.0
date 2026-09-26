Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795B543DA50
	for <mfd@lists.linux.dev>; Sat, 26 Sep 2026 14:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790433677; cv=none; b=O8gYbwwmqv3d5yugzNsu+B1pI1huME/zm2pxvkQ+KnCAknrsBF/j5IpH+WR8boT76Eje7GCQh0kApcvtTk1hssmtfvklJqLpwUhu6nBo6nN9f0x6WQoCP3Nztm23pvnNyNP0JIW22PGAOp5KTX2m+Rfn5ZJGMHvLoSZonOvNYJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790433677; c=relaxed/simple;
	bh=oiXRKP29ZUO2dA9Y55/UdFoG+3sZBM2fEQlPHS6Cq0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fp3h6vOLAr+LLsAPz4QC2WvWFjOAGtkADYq0D76P6yOOwYJK2bqerilVGcXyDzCA0HfTC7vLhgN3lB/2QrSLOVRZo2I4zWQbKjFc5+Eo2lS+vchCeBOSrygByNThnJLwkMJi+QYld0ReliNR3vZlWA0pPhuGx6N8alDzLAYLveI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u+cYWwpb; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u+cYWwpb"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-482f63546c5so1481868f8f.2
        for <mfd@lists.linux.dev>; Sat, 26 Sep 2026 07:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790433673; x=1791038473; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xu9tR3djwphJGXzBWF0dvsjvBTAcOuke1f5Yy3j2+xk=;
        b=u+cYWwpbEmgvR+Iv+WUCl4zGe+dtGosBdrlYjHiwfG7GPri9Ujnx3rlggdFcKwshtd
         GKgnZ/0tBQyowToK6RCbsnLsXqbMjoxIqN7EuFZOJ0YCRNFIG0d9s12jaORWpenJIuCB
         rBNXbLkZKmBhOwbFtxRf9VJj60aT0Asvg2uHczfiWgcDeKsOb5aq4CL+scVvbwO2w7RJ
         3Bdol44KaaLbm4RDDhB4G7Pv0H/1WmAc49ZqkpN8nr+5ZvOBAPZjcxgvYs7W7RvnW/X4
         LtXQkt+acSfZW61Mj8zBOqs7e3SGifu+43DAyTiX52lN4NCWbbBKhy6RE8lFjtsRqHcn
         7ZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790433673; x=1791038473;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xu9tR3djwphJGXzBWF0dvsjvBTAcOuke1f5Yy3j2+xk=;
        b=iUsoh+sL0iKeXZbpVjW8+tD1UL9pTpYmQtH3o3dPu/l0z9OIR828+zLFFkxRHsyN1X
         hzp53p6StbPG7f0GKu8OJWoTBjVHOtL+pvc5p0laJd4JVgIR3IhSsBXBPcPsXN5jc6LM
         qojfou4DJhYlwaArh3gR+ltiThY9e0sL3lbZ7PNHAf8JRA5691sTjwOC7RrtT86sYceV
         Rbuk0ta3v3BWLug5TGZQzI7rx1SLHAjzhzXkBp11euGeh5s8l8m8d2NezenrZCx1beM5
         mPBMmKadlo2Z0Q165iABUZTBVDeNNTkClNnfHTpUN1xmFWx3H0WNnuqA0dlNBN25CMK2
         OMHA==
X-Forwarded-Encrypted: i=1; AKwUvBy0h73nx3XuSlKM/eMIWL3PgxavCgZEoUVsAezaLAKZl67y+mJTyjjgcKAs0+BX5a7u4KA=@lists.linux.dev
X-Gm-Message-State: AFuF++kjAbEyN+U7XLybKZY9EyvUqe2LByLUW5mniw/DE1vayVuvvB/T
	IRbpqx9E70vv4hMcgy4GfVbjajnTWJ6jIVGeWHrHX0D47+1QsYhelIsgNs1QuE5RExA=
X-Gm-Gg: AYBFou17kkTNlXjnjp3MVbU2dDY8oiTP/BQlmSrmf5lz4/5+tvuGtgtBN9wQudGUSKv
	anwInpJQFb6H1D1WRAFKk4ORgSJBCP60kNDqMoX1fGAPYvpf74FSPuCPUnx/bdgKnZpctCrYB3o
	luXCUz4jr5lL0h9ygIOOGAfDN5dGjWSq+Aid0wc2xboAodyqdjILI81IZZUmKiKEwMIZFniH86v
	u+20kClZ6r+2obJhvfG3YlI/eXqTiFhSsk8YhJozrT1a6JUWWqYZj6UMhdR7kgKaOb26V9zwkyH
	F31fuB8TupgzVR2fY5jJpDo5P/DDLtp3jcsNa1KjAHtsi4bU3CHkno3nB4VRZyN57N6A+/JJITJ
	zb76CBaIOntY5uYxtET8pV3dpovStbWG0y5tkTfAJ/8Law3WXnLR0edqaFXK5kcYYIUHUuqY1rI
	NFDtzSr8hEAeEMbqk3T1/Aix7OA7+FRFb6F7QYie5ggutbAf+L0nQRHLceEpNfz0ybt+Yw2tRky
	qj06bLJud+cfBJmkbwGibM=
X-Received: by 2002:a05:600c:4e12:b0:49d:1842:f001 with SMTP id 5b1f17b1804b1-49fe66b6e0emr156760565e9.14.1790433672783;
        Sat, 26 Sep 2026 07:41:12 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm228645705e9.13.2026.09.26.07.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 07:41:12 -0700 (PDT)
Message-ID: <8f6c3e69-f616-42b4-8e33-f05ac0812722@linaro.org>
Date: Sat, 26 Sep 2026 15:41:10 +0100
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/12] usb: typec: qcom: Add gen1 Type-C port support
To: David Heidelberg <david@ixit.cz>,
 Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-6-31adc19f32c6@ixit.cz>
 <4f089c98-a479-45c9-9b11-0207c895367a@linaro.org>
 <f83b2992-9214-49b7-be3d-28ad435a73c9@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <f83b2992-9214-49b7-be3d-28ad435a73c9@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/09/2026 15:32, David Heidelberg wrote:
> On 26/09/2026 16:22, Bryan O'Donoghue wrote:
>> On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Add a port backend for the first generation of the Qualcomm PMIC Type-C
>>> block, found on PM660 and PMI8998.
>>>
>>> On gen1 the Type-C CC logic is part of the charger's USBIN peripheral
>>> (base 0x1300) instead of the standalone Type-C peripheral used by
>>> PM8150B and later PMICs. All Type-C events (CC state change,
>>> tCCDebounce done, VBUS change and error) are signalled through a single
>>> aggregate "type-c-change" interrupt, the handler re-reads TYPEC_STATUS_4
>>> to find out what changed. The PD PHY is register compatible with PM8150B
>>> and is reused as is.
>>>
>>> Differences to the PM8150B backend:
>>>   - get_cc() returns -EBUSY until the hardware reports tCCDebounce done,
>>>     instead of using a software debounce.
>>>   - As a source, only the default and 1.5A Rp can be advertised, 3.0A
>>>     requests are advertised as 1.5A.
>>>   - The PBS workaround of the downstream SMB2 driver (TM_IO_DTEST4_SEL)
>>>     is applied on every power role change.
>>>
>>> VBUS sourcing is optional and only used when the connector provides
>>> a vbus-supply, as the charger doesn't expose a VBUS regulator yet.
>>>
>>> Assisted-by: LLM
>>> Co-developed-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
>>> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>>   drivers/usb/typec/tcpm/qcom/Makefile               |   1 +
>>>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      |   9 +
>>>   .../typec/tcpm/qcom/qcom_pmic_typec_port_gen1.c    | 605 ++++++++++ 
>>> +++++++++++
>>>   .../typec/tcpm/qcom/qcom_pmic_typec_port_gen1.h    |  15 +
>>>   4 files changed, 630 insertions(+)
>>>
> 
> [...]
> 
>>> +/*
>>> + * Failure of this workaround write is non-fatal and
>>> + * we can continue with the role transition.
>>> + */
>>> +static void gen1_typec_pbs_wa(struct gen1_typec_port *port, bool sink)
>>> +{
>>> +    unsigned int val = sink ? 0 : PBS_CRUDE_SENSOR_ENABLE;
>>> +    int ret;
>>> +
>>> +    ret = regmap_write(port->regmap, port->base +
>>> +               MISC_BASE_OFFSET + TM_IO_DTEST4_SEL, val);
>>> +    if (!ret)
>>> +        return;
>>
>> Why would the write fail and why wouldn't that be a critical case if 
>> the write did fail ?
> 
> Heya Bryan,
> 
> thanks a lot for reviewing the series. For the rest notes, I'll 
> incorporate that and/or think about it later. Here to quickly answer to 
> this note,
> 
> this one quirk is definitely NOT REQUIRED. Originally, I was testing the 
> driver without it on sdm845 devices, and everything worked without it 
> just fine. I ASSUME in some situation or with some devices combination 
> it may come handy, thus likely if it fails, not much usually happens 
> (and clanker was suggesting to port this one from downstream, so I did).
> 
> David
> 
> [...]

I ran this code though an LLM and it is babbling about the "shape" of 
things to hand you LoL.

Anyway the pattern matching part flagged this:

"Write outside the node's reg. base + MISC_BASE_OFFSET + 
TM_IO_DTEST4_SEL is 0x16e9, the MISC peripheral. 03 declares reg = 
<USBIN>, <PDPHY> only."

Worth also verifying.

---
bod
