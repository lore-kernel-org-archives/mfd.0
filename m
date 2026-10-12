Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0364C450415
	for <mfd@lists.linux.dev>; Mon, 12 Oct 2026 11:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804716; cv=none; b=I0LT0ZXXMBC2kxzj9b49S+XkSmA3Mp1wXIbhjp+c6Xlj3RDBopwj52bpviSgcr9m63G8rA8fj48DbsRkBAnNpTXCjUGZ2Qqu5wAio+UZr0BPaRHmWTgqj2Gt3WHDWmbTO2+ZDsvptl1fd/KaeRH/7OHIMRhCAMJSszGrZubIdH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804716; c=relaxed/simple;
	bh=JUrzZCqhpr+6E+MrqT462051gDoUBC8OqfAEbMmtKk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YL1dHeQ3v436JnVgL9rA2PcGgsqtOLNBxpmvc/QK4p14O/C09EeIvoNSXbYNhtc4uCyctJi1uTOZ/iR4udF5/ULNsQhUs5lLs7D1yx05AHqsS0FSsUtpwF3PnGBGDONo4nbNqs7Jq75R081swNGHa43cfTxz6Y4rSCoukwxtgMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=duRWL3Ce; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0FCwClv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="duRWL3Ce";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0FCwClv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CA3YEE543546
	for <mfd@lists.linux.dev>; Mon, 12 Oct 2026 11:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HhAsnUJQR0XtnLbL9uGATdXzBNkrKbvYlxu+kfkmiW8=; b=duRWL3CebqWstGBk
	LhiyhfPk8Z3WHzzyHSmiLSR0RscJNhZXVAMK+Yn//PiDA/qa5OCvtXlOaNw47QYR
	/OXL8m3Exx3xRyw1i+mRLPNDh/t+k5W5hRCPmQt1cL09xzadNR9zEpIQBqpajEyG
	3NKhmc7pDldIGWHcTt3xIt/6xaedNdCzio639P6Gm4xh/mVZxASetH/B3JUlbN9g
	BgtjZKmPqWpI2Zn6J98q5PrACqPXzPqBkaEtqe0NihiMkb3rsyjm80ZrMbAZ5ssA
	sU7BB2rN6IqH7esbaOLMjNgN4rHNMkNkG/5xXExFmPyfGbW+sIVYzUyW6JqzJ8vQ
	bu1zfw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcregj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 12 Oct 2026 11:31:53 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5e53d86f8ffso15627e0c.1
        for <mfd@lists.linux.dev>; Mon, 12 Oct 2026 04:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791804712; x=1792409512; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HhAsnUJQR0XtnLbL9uGATdXzBNkrKbvYlxu+kfkmiW8=;
        b=j0FCwClvc4GScebRCR2o1W+edSSmNr705GeHq6W8QdG3+WgosBO3zkS9mqdD49Tntx
         A8P0/IgD/h/l0CRQy/To0IQxEzESv1Zjyqst7IHP4l+tcD0QM2JD5mcXDkmb9gqvjmqU
         sotBzIsA86z7KVUHx4NiXdhMQYYkb1WvEaI2xtS3uEfjB3qIDKpKc6Gn9i12YS3zP/P6
         AZWI7Nyraxil81nAFKgq3gWyDn4rT5zRXGjptN2CFRPqKhhixwve6husvs/TUB76BaFH
         /dRzZ7T2T6VgEXwB2Bb5XN3dVkaGCAtHeg0RlnUM5DelKTdE+DPqHpud7mZIfyGUzRa4
         GqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791804712; x=1792409512;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HhAsnUJQR0XtnLbL9uGATdXzBNkrKbvYlxu+kfkmiW8=;
        b=2S35T/DcHCOFlkv+/kiqNpMxfdcUvKWF/8G0R5xa9c5ZTdr5RGgDmeda3CNJzjqtfM
         2GMfyG3qpsnJtLl2vLkaTaO1VKa2p+jJIMFcpUv1noERednk0HSvnx38jEw0P4c5961z
         FstWuOYKbWhTDKSMYdu9glIX9svz00QHsDYdTRqqY7hWA15sivkWYMZL9UsUrRhBRFs6
         iqkp/6sElaVhjhTvIbvIDcDM59QHYZpUe0n3EJTmnlGM+YQRmTI60m3T3wHvtcErJ+Rx
         GteY8ZspVyx2Xl43uvFzYlaZzZJTjlhhoBZA9T1MRUQMfxCO2NrcV30ZIo5KYW7HZhVf
         zPvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFKJM74kUhEbqb367A4eKxN0RtjFTDm5ImlmeyJb5hSYRl2I8tpdZqKI6ByloJ4p+gIE0=@lists.linux.dev
X-Gm-Message-State: AFq9FYKvbIKWat3j1ru5gE0xXiHBzWMFUTSbiMretKM/EhlcmXFzA9t0
	OCpSP5ZO0znbKFfEqA5xVxT5rLE2W6UpxGHAvu+jBcavHyhGZ8vh213qVQLr7Cgf17wECieH4mH
	1QopM+hPkxh3yzWKl2QyAneWHqFGbB+E3SKyfqvkKsLqovtLTxN46ckM=
X-Gm-Gg: AYBFou2eFZ+5o0Y9ovbl7WzDa3tm0q/3ezRlUiu82UZbx435siBE+eiq0OQwCAdeaG0
	xGjb/j9DKCIhW+aLBCiW4fDkBkMmiURhmiuxOHrrzzOsnY4wxSC470+eZ9oIJ8EuTO6ZmzSa7fe
	CVBBMmvpKCekySfunGdwd9rUA2MQd9MVXn/fipV+gGxcQfBhYY1wBeg1P84cao4K8UrrEh+kirL
	K090yUMAZsKpVfBAPFd8NR4VcSx6A5Azo+CFWE1eWbdTuYzLfQeo36Spud4MxfdATAIplUMelqB
	/BX4BkbxdfJC9G/YzMQPEcEeqH87sjzhuaKhfJhWwKP1wAwZOOizOJJEHk/aZejwBoTFauhTjkU
	XFfHaOI5RVbT/w2XQQTegJQ==
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1210578e0c.3.1791804712092;
        Mon, 12 Oct 2026 04:31:52 -0700 (PDT)
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1210569e0c.3.1791804711604;
        Mon, 12 Oct 2026 04:31:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c344ab1453bsm157724566b.67.2026.10.12.04.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 04:31:50 -0700 (PDT)
Message-ID: <3a5ff85c-0629-493e-baa7-543958764219@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 13:31:47 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] hwmon: Add Qualcomm PMIC BCL driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Pko6u5V24xTPp1ECj-I68aKliHnhfNOI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0NSBTYWx0ZWRfXxfiDIXqSyYJL
 t956aqM/ZVOB0fzVmktPKBYYdWGnOfxc5n/k9gHUSMGDyUceu2qeD04uXw0eeExrdqbvmYj2Xeq
 vPO7shUpwB54xUuCKH2ce2S5bCexGvI=
X-Proofpoint-ORIG-GUID: Pko6u5V24xTPp1ECj-I68aKliHnhfNOI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0NSBTYWx0ZWRfXzZXWQCEc8uQy
 eZ65e5jUiL8g1KpCseE8YADylN/IDRLgMA1csiIAy0kRs0DmhUqSpj8jG5tofpNzFdkQ2C1fRGI
 qC7+31Olk8SHkGGgjuW+JgIrujEwmrI1smoNsRCWDDfFcAuH/wGgadNfmnOzn3TvzIy2e6NF8+Z
 TvpD6/f+28NimrgZPTwUaypjj7NrbcEr43suFT5M2w/bCgaWFEcRDqqaGrUobMMUsHmXRj7e1DN
 4Jvo/hbVFKqmNGBuwsGa4kNo6wUL0qNb2NYfyzySj4rsH2HiF0FSOIy7/PYU+8n/iLBLtIDUxuy
 7XBIWny/mRgP2+nh+GoFgF35d3nJZoLY3uRRDl61CzNWSlGvEey0WGBMfSGjmj44IBlJUpSNSKB
 nqgAtd+TW/GcFhKSpkNrqXjSQECvoGqfIgOLATiwdJBZ8NGfuYKzv705dDmpJcBDKxHmZ04EVyJ
 /LCeS+o4IkBq7hfwUgg==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6accc529 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Ojr5x5PTsytl4pN-IXcA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120045

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add driver for Qualcomm SPMI PMIC Battery Current Limiting (BCL)
> hardware monitor. The driver exposes battery voltage and current
> monitoring through hwmon interface.
> 
> The BCL driver provides
> - Real-time voltage and current readings
> - Configurable threshold-based alarms
> - Interrupt-driven notifications when thresholds are exceeded
> - Automatic threshold management with polling-based recovery
> - Hardware-specific scaling factors and threshold representations
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

[...]

> +struct bcl_alarm_data {
> +	int			irq;
> +	bool			irq_enabled;
> +	bool			irq_wake_enabled;
> +	bool			shutting_down;
> +	enum bcl_limit_alarm	type;
> +	void			*device;

Why is this a voidptr?

Konrad
