Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39AA2C1788
	for <mfd@lists.linux.dev>; Fri,  7 Aug 2026 02:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786070068; cv=none; b=QcV6aT/UI1W/RUsfFEjC3GPmerSTuD6Tql3NeC9ToNsDszeBgEzoStYPmCgreRotNX4RBS88Daj7N/Wp2V7ULw3NlLdZSf/T9Ps3ZyBOddi/g/k7UAHC7UHmB9bHchMAwf5FJZ8OBfeBE7tAuItojC4CDzF9a0q3Dnu3Q5Sxx1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786070068; c=relaxed/simple;
	bh=F3sahIc5F9H37XPLmF3ypq3puhEsMkLGGOfvBF+VKNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yxc1brOZXHCXWpz2RmL+VE1tfM/Dvrjc4dHHMBUW1sXrXU8fBf0WjvNxECycXVsYA7Yo24fg2oayekEAWfjTsJx10eCZh93FVKfhzu1bdwE26OtsH6R4G6ZIS5RwonwwiXJ5L1j19MQQQRl9u7vQagOc2xB+KKz/bx9+xPjhA64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AoVUPr/K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iw4Ztf1R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AoVUPr/K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iw4Ztf1R"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GnGm3829315
	for <mfd@lists.linux.dev>; Fri, 7 Aug 2026 02:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ndFmLvtglCbgUdpFBjfySPC0n0eZtwY946Lp1MLj3Lo=; b=AoVUPr/KMBCJWVge
	qjJSDEs1VQYikwckSmo7dfD9rW9exsurvTREmlIY/goqwA3EpvD6QjXkEEbNFLf+
	IVCkf62Zcl6gCQGgLwbivuGOQ6g+tUElaqeAt9H3ihgavJ8m1eu5eguyJTOyGBPC
	RIE7H2c8mDtuceV+a/Bqv26NgznSEsxSmsC5ngZwBZ92keCGplQfZwvXsL6k1ZBd
	gQ7KnvSjvFetFxuB7ulCTyFVfvFX8x/wyTgzT0J8zer/hWV3+VRxSmQM9RuuU1M9
	mSBWDF6Rjq9NsadiuAtO61EjskxftmFLDPBict7DeqZJb3OGRuwd2RTvPAXw2lkx
	hQILAg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6gsw8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 07 Aug 2026 02:34:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bf321d786so31721121cf.1
        for <mfd@lists.linux.dev>; Thu, 06 Aug 2026 19:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786070065; x=1786674865; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ndFmLvtglCbgUdpFBjfySPC0n0eZtwY946Lp1MLj3Lo=;
        b=iw4Ztf1RUfw2n5jFV1D9SAu0tQ9DVufyfg/IJSyAljmfNtiVdmkzF/tMyuRRAqz1Vu
         MNqAxc8OUElEvqZDxNZTEbH8bJ7lt8pwh64b/bIbJVG99ZclGhAyvIOV8o1HDifhLIcc
         ZzhGQosbE3SpT+ZM6W6jKAI3ICWTLNDb+Lz/GIL3XHDWR9kPK/aVDCNvWO0tYnNJQyG8
         NS6WUCqSOFqjiAd1PR33m5/9fa7F9OBVzBiPqvpRAyqgXuZO8/drpxZhB1q+S4TErVSc
         NjkYk2M0KIwplF4KfB/KxoMlTHBD+0dQByH7QDowAbgEPWX5zd6VZutLpIyfCKiYTFlo
         fdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786070065; x=1786674865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndFmLvtglCbgUdpFBjfySPC0n0eZtwY946Lp1MLj3Lo=;
        b=XCnFzBL0zleVOyLuBL3Gmzy5B/g4asApUZ/yRkwARHqNVWXrewjZ2bkwlUdTYwfGT0
         oiq7BLmJSUVgnV4AsuuxiG1XxvnZzo+aOlTbAZCbhgg64lLdlZCM75+kwoJROq7WWjxk
         l3xHE9bdOdJs1kcZyEa9PXUb+qSk60b1XGABadjJup69XQqr3S38yIvEnsib2ha8HWaB
         XLz9WgIlayyXb3pZGDRsV5II0AUmdzA/oxTy5mueTadVk+mAQgu6g3cS4UrgWyRJO8+R
         S4Up18IsfZeUvheuEwyBpQDTwQuFziwwlcRHiH/utLfRXgPqGugZHFu0r/sYd/H4IOH3
         E6NQ==
X-Forwarded-Encrypted: i=1; AHgh+RqDM9Opagly18UBXLOGYpOZ0E01K82RsVjRxdzUiiada3U/CQMpxqfPqrYqfelwZY5kQbY=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywmw4NnL9N/yTtSiuc3V59u2gqPzMCcaPNbq+Y2XN1hsdVXB+BU
	4knP3yFC0U3HEi9y8ryI0HJVLyVbRg27+zBMTL9q3D8E3Jv97ekqjmOjWlTmSX/uLmHac6NFxGG
	oHPMyyJjTF1D6FyvLBlFmcBHho06yuHzKXbQu47q9so1QCIM0faZ/M/w=
X-Gm-Gg: AR+sD11vDGH8RvVLKpUrxGZ3U/iosINxyMNMyFZ5QPsVixmj1sJmZ1UY+HCBXVr0OLJ
	q4nwh9CWZD8EIeDFVwdWAb3AtVkKGK+TxVdVSEZwwcm9QEsbJwymrU4kHBEb89eRMCCYBaQWR0w
	RPCR3aSosKcY+485IxZXVuMFg/6TLEUCbHDjynJVo+Hp7Rd7/oKbgZkh8HcD/zYM3KAg1elByDi
	8GLaSwjA/iKTLK/v/hG2fPXtnCfi28et0lotYaO/6JZOSq1X129wKncL4XfRfOqSxv/++u1KmW6
	5AXvlwtEVkCKd5JVAB+aIlvbjsRpOuJA8+PfyHQS2K9lDnqiW1iNfMBIta5MbSc/jqW0ykwInef
	Mz8oJzWSnX1KIY3FlH2bT7ge6/6MkBAOX1JyUSyH/Zrrctg==
X-Received: by 2002:ac8:5c8b:0:b0:51c:1f97:e860 with SMTP id d75a77b69052e-52d18e1a675mr1913531cf.3.1786070064604;
        Thu, 06 Aug 2026 19:34:24 -0700 (PDT)
X-Received: by 2002:ac8:5c8b:0:b0:51c:1f97:e860 with SMTP id d75a77b69052e-52d18e1a675mr1913241cf.3.1786070064134;
        Thu, 06 Aug 2026 19:34:24 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a4dcsm113421675e9.11.2026.08.06.19.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 19:34:21 -0700 (PDT)
Message-ID: <64e146aa-4907-495d-b394-7cecb1727816@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 04:34:11 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/6] thermal: khadas-mcu-fan: Add fan config from
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
References: <20260805-add-mcu-fan-khadas-vim4-v9-0-75df78710b9e@aliel.fr>
 <20260805-add-mcu-fan-khadas-vim4-v9-4-75df78710b9e@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260805-add-mcu-fan-khadas-vim4-v9-4-75df78710b9e@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=frDsol4f c=1 sm=1 tr=0 ts=6a754431 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=YaFGZCiNkOP6CsGDcAoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: S8D9fIW0ElhPYnFZbNDq5zsoS0QAdxLZ
X-Proofpoint-ORIG-GUID: S8D9fIW0ElhPYnFZbNDq5zsoS0QAdxLZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDAxNSBTYWx0ZWRfXwsTQAtkJB8bV
 +ultmKD1G3QoO8RYLkixr+7hr5z86OMnvYHkYRaWyvH0lAKcm5rJacrBs6xQxFI9BADyPe1CVhD
 jM6oqqmWpOexQ2lxI1crjOi8M6OpxCE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDAxNSBTYWx0ZWRfX47Gx7k542MwT
 V1feskQiHSl5lUrdMTWjyEivqH00Z2QHarsTC59EqV+xCHgDJTFCDPaKlg4XravqfXgJKenybaJ
 UtX0C3H9+O8hkt/6LSFsZGw1EBnuF6oSqP9C/yOGRn27m+4DxwT20qJ4YTC/M1xjafEd2VTTyfW
 SVc9Hc7fuCnNJa9zQCru6l0cHg+w9+DgDq2ITpS598+8ZX1V0CfHc2T+H0l+ySc0ULCNcuzH0Oa
 mlZ+BCzq2QPe4IJnr3atpcbdwHByiEPHhppKxtR6rv9gD/tCRtXUy3efSFcGbvEHQ/AEJ1K32DC
 v+C60uHnttPZZbVI83TPiVnb12pDp//jTfNNrxpXhiWKVnWx54aYlUZV6BNzOAcxQs3zN/Gi/EN
 P89f8bhnUL94P7D5ks13wCihaF/nPC9gn/Djmh5gk6tqaUWnCLqdGhKzEjyqSkZObgKp7TKLirb
 hf+fW/oC82mY75QfufA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070015

On 8/5/26 10:06, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Replace the hardcoded MAX_LEVEL constant and fan register
> with values read from platform_data (fan_reg, levels[] and nlevels),
> as new MCUs need different values.
> 
> The cooling device's state is stored as an index into levels[],
> and khadas_mcu_fan_set_level() writes levels[state] to fan_reg,
> rather than writing the raw state value as before.
> 
> Optionally acquire and enable a "fan" regulator supply
> at probe time and on resume,
> so boards that gate fan power through a regulator are handled.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---

  * Through which tree this patch should go ? (assuming there is a 
dependency on other patches)

  * How this will behave with 100 levels with the step wise governor ? 
For a 100ms passive delay and 100 states, it will take 10s before 
reaching the full speed
