Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3443590AE
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 09:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722757; cv=none; b=GXGZUQv3/rsoLS+LqhUvk1XNmeJi0m+SOyXN2ltkKXXO4PqC5WPWy8tIah2vkBV0vVnGnR/JqMufWgEBap0BvE3yMzjGds+XgClJqv4T12Vmuu9ZEBYiXxWCQgHGkC2VmS5kkLlzVskcEMwzp8tFURrSXcFJs98PrHE6zDT9n3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722757; c=relaxed/simple;
	bh=dqNLkYWW3gpedw8yQO06Nn2TvNDxzw6IotmjZsfjq4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qv7Ai8OVyyJlae0sULUlqagAT9XWFZmQ/KjhAiraZVjU86SUP5F1a5TxebdBIytW3eLgdVk0mTkWpF92hfqjZ4W1JIaFBoLCN16HOn1yTG6XMZO9DwaMp4Fsm1BJGca81+AYtDp7KQjkZ4KSij6lT83RTs8RWJ3O4OY0yGqmb8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UCVq0oo8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hhh0SRvz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UCVq0oo8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hhh0SRvz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xrpY204093
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 09:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8KWbZAe8YVsxv2ruoBpbVgqJH0J7SyBNe9cK8WaU73A=; b=UCVq0oo8hh3zpuNN
	YkqNqbz3333d1T73kirv80Sdf81VJxW51udbIcADdlqdimOPwFrBroXRMNZmCa76
	kAeBZfibEQL0ApMCmDR5Yli8Eb+1FTGBUYooe/kIfRqwteQSs/Q9Kkw/lOQPmJcC
	P3C8IMJkP61fVh4FHZ2v/Dm7Wj+kidskCGgUH9uRCWb5JOlb7RmHS3xb+JwgGWeI
	Gp1UtYJuSXW/GoRn0ybRNCpk0pyvklL31mHpqb48WnvgoievVWUZysFa0eqKW9nD
	JzzYetzT3VYrkLgMM2DHhuCBz2nVo11zppWkJAlEXh3mCCNygH+p1RyoFvOwI4V3
	gMIuqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grxp2s0j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 09:12:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93918756165so98428985a.0
        for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 02:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789722753; x=1790327553; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8KWbZAe8YVsxv2ruoBpbVgqJH0J7SyBNe9cK8WaU73A=;
        b=Hhh0SRvzO0DN15BnvjPKuH6nENzv+zG+ycvKrq6ZxGcnhaLbhEdt3PmU60DihKm1TT
         BnLYiqrjNuWuTxjyafTr75R2fqqKy2mMdqdj3dowHqd3EOrr1opH3MYX5wQL2vQcoizf
         16MR1CodiCc+QRKh5H6AuK7ZqiLE7P4BQV0i0xTNx42xbvQKGUXnoeBgO9n9u3/PJG1H
         qS1x65GHnzo+k6pyst4pk+E5mm5ZHCIHaT/gvws278FYfd4kwyYnhtenT1dGoB1JqoTN
         qvYceBGQ3QtNoOoxlQwMHRVQ5FRVFGiblRLiV1h2lAfLGnorHD821bS+vPJpSPdOmpEU
         2Tng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789722753; x=1790327553;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KWbZAe8YVsxv2ruoBpbVgqJH0J7SyBNe9cK8WaU73A=;
        b=UWYzMzNstQ9gYBbzhAzI4XBNv/d09ymCYIUUptwuw0Bl6Xw9QP/0YqdcOpTHCBLLwk
         McCkcuO7iSeWhkPcM70QM09eCa4v0FYl833O+Pg+9xCTyYRBMxzxLmmw96iglagIs54s
         Eh7DpmR0vxwsCqJQui+By1UDdiXAqiUfz48smGlPGMK59AwfSEVsDG56Eq/W2cB1uGg9
         0miAs+hgFBmBxMmuYki0IXEHueRPUZlGQR3nzgAMv5Um4uyV8LGvct8W6heFhz8vTcHe
         JAsmw6Chs6huZgLWpKStTcfPGRSiz/VLOj/Yy7yKZ6LkPoEBboxUe0KcVHO76bgmyXp+
         beKA==
X-Forwarded-Encrypted: i=1; AKwUvBw2BUiYkuZJSa6cm5UCSqQuina2bEH0uzB2a7VUUKb+jgkC8apk2sJvRIXbEIJM+Mpi/nk=@lists.linux.dev
X-Gm-Message-State: AFuF++mDHz719SAkuKhx76djXi82hGdkrA/huAOnuHC5YR4FnMtYZBxZ
	Hw986pTcy8H1085zzCdPQ1U7d8ls4j8Ncf4m6hxCFldJ5RgW+Sqzg5dlMaSz2ii6BsC6jP+xxtS
	me6LeBbPKBHNycF11QMR9JUujJUyrm+gJmENYwrPHlw5Y/ep9e6oVVIg=
X-Gm-Gg: AYBFou2xDuP0gDuLjlLnHhl6+6CD9wnPjHy6R2XSJsR1vZnMLvcjfbFDzHvBkP3/9/V
	XpV8vwMmW8AQejnMmDKeFzmLCFm1oaf8aoKo2ebtojsP7i8F1kSyfZ9VTPFizLxc7tttodsedV9
	cjY1rVgvg114bF+ieRf5LGTL5JGse3hsEwPtjnE6uhthDOl0gd1v48hB9+yQT7XbGK5onHFVClk
	Ysnksr67Kw4Hor7z3jq0+t9PrmwLd+Jk6Q+LmGyGV7FS63gUmCljkiZkd0Sx166QwPu28G0tvSv
	c5sDwDuEqTpx9/rPtB75Tyqfbg9h1YaSyC49anXZnPjq2zTRpL3mAlDGoLEaMDd2vzRsr7aWM3O
	Z+8R6/pw7PYcuvzH2LDG2sgxQbIGPlSQjpUNRvCM7jtbtxJbWmm+31hKMem7cG2M=
X-Received: by 2002:a05:620a:6010:b0:939:f513:cc3b with SMTP id af79cd13be357-93bdca3b239mr216700985a.42.1789722753610;
        Fri, 18 Sep 2026 02:12:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6010:b0:939:f513:cc3b with SMTP id af79cd13be357-93bdca3b239mr216692185a.42.1789722752340;
        Fri, 18 Sep 2026 02:12:32 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc58a1176sm31018885e9.2.2026.09.18.02.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:12:31 -0700 (PDT)
Message-ID: <45768828-d0a7-40c1-8eec-3a1fb2d66a71@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:12:29 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/6] thermal: khadas-mcu-fan: Add fan config from
 platform data Add regulator support
To: linux-kernel-dev@aliel.fr, Neil Armstrong <neil.armstrong@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Beniamino Galvani <b.galvani@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        mfd@lists.linux.dev
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
 <20260917-add-mcu-fan-khadas-vim4-v12-4-497cd543a148@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260917-add-mcu-fan-khadas-vim4-v12-4-497cd543a148@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEyNiBTYWx0ZWRfXzViFOcGMp/UZ
 E7aNviunNaMosoFiDANusaVdxNh8n8Ay+n6vpfFxo+/VUWcWX0kMjpbmXuh4aAaqGSfmfPUsaDr
 QvV6jIubfcnWsbMkcYt/zBdTNlcUJXw=
X-Proofpoint-GUID: Yp5IYXYdQ9hFnkQhNqq4ENk5z5Dg4Z6B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEyNiBTYWx0ZWRfX8B7SKTBElthQ
 VODbrAcBjjBNrjjmb6/+Ek0ZO6YT/pCNt493b8cNaPG78TWD210CjLQ4xg202a2Av3UkmoAjgmv
 bv76Rspxi3AD10LmrgZrdF8X8O32UfY6m1q5ljc7yBGF6rcv++pjkvaJurr5i43wlfY+fY8TunA
 PzI03bV1avjs0WCfGWFXqNKvcLv74snkj7SWihe4VJdwP8DvueM7qG2I41/jbZdskpzatSQrkTm
 J8LpzTS9LVP0EcMOkjxv8FDPmkFFOnPBjh4ze1olIc3/Uyrkf+IPkF+6/iSNQ+L11ISC7339DYI
 JpA4QknfqINc3AnIsPHlo3tdMfostdlvuF3h+mvE12wkzzf6AqT2ZLPBMUSz2O9kSVJnhq3G9t8
 hEjXbOXqxpoXD0uWnmkR6FEzLaCZ+GgdGr7TZDI1s1BcYYnthcVMEIEzyRQ+QKANvykHLaUOMD1
 Wl+NAU3v7hP/gmQfuXQ==
X-Proofpoint-ORIG-GUID: Yp5IYXYdQ9hFnkQhNqq4ENk5z5Dg4Z6B
X-Authority-Analysis: v=2.4 cv=cNF1IVeN c=1 sm=1 tr=0 ts=6aad0082 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=YaFGZCiNkOP6CsGDcAoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180126

On 9/17/26 09:59, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Introduce platform name, control register and duty-cycle
> levels per variant.
> VIM4 uses a different register and level set (0-100)
>   declared as a list (0, 30, 40, 55, 75, 100) compared
>   to previous boards (0-3).
> 
> MAX_LEVEL is kept and bumped from 3 to 5 to make
> the speed change more gradual with the newer MCUs.
> 
> The cooling device's state is stored as an index into levels[],
> and khadas_mcu_fan_set_level() writes levels[state] to fan_reg,
> rather than writing the raw state value as before.
> 
> Optionally acquire and enable a "fan" regulator supply
> at probe time and on resume,
> so boards that gate fan power through a regulator are handled.
> The regulator is released via a devm_add_action_or_reset()
> callback.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
