Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795698;
	b=O8570Kn01na5Aam9qKs3RiuK9gx9uhomrABTBNEGEE+7nmneB9MB4nbAAUtbQ+Z2QIFl
	 uFNrs2D4sMfD7Ny0z2dXYOXLnJpVJDemQE64GhqdnkMbTHcp36qwPYshX+abR2IUNsx5y
	 BkGz+GXgWTZDH6Jlz+dLmuHBUdZG4DVxQMQtTWlMmfPrgJQvgwjUFtq2b0a92qHQ4i8m3
	 2F6IJcsxdwrV0gbkeGAQABjoZ0ie6YAvCDsQ3eOLtAgRQ9LFEB/zGSlBBDvcM1JWiS1KZ
	 NOc1+/NBkFdBBfWKevRJ4F/xLtW0+yqF3TQIupbY/m4HXTnyI3+xnxgDov4hLNSxMoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795698;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sds1MGBA7G+Tt49HG3Xil58EHIRS9PXgqNLiElDB5ps=;
	b=5WFacn9vpLQuVW6LbPUh6ppskFWYBJl5Cxjl6H3fK+GwxFiKmVM50k7Dd5ToYtGxt7ES
	 1TusErlT9sPBGtHDC7wCT43GbcTZWyHy1VousSkeK/GmqV3yvEIgVtUaroVFo3yK0XoJo
	 k7qwX77lGnmw5B6x/Snx1ptjmzxD4nbr/JH1fOMhDGlMH2GaRSVgCOIlSgYXeDbatPWos
	 ci+rLba+GDtFqBLVzFZ8TT+PuK0HduIr+gNlzCbZkw8qC3F0oEM9R4EEnJB3G84yUDXxx
	 OnOnrItjoWUuaUw1ORlWpVh30kcXUXNmpzNY3byiofOKkp35mNRioQA6LF8icEPj+Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pOfqafgI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=StHYqt0z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2684606A328
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 12:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2684606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pOfqafgI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=StHYqt0z
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BaBc72728930
	for <mfd@lists.linux.dev>; Wed, 4 Nov 2026 12:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sds1MGBA7G+Tt49HG3Xil58EHIRS9PXgqNLiElDB5ps=; b=pOfqafgIiyQ3bF1F
	wCGdEsEymDm2DhPxE86PtdcXoDmoWAokBuaB+EABu0eo7mt50FqVGPRqsTkHmgxn
	h66k/NByR5wpJeHuR7omk7Gdp+cUFNDikpZc2tmnTdbTH9GggWJO2n+Pd39qRvXf
	sc5te/+SfEZihjhJElibGAhEjxJCz5P8SfKBSc85bG+DnxIHgrMfWbbRZGloG2Hi
	s4bNDBAFsJoQf8qgcuU1CuRq2a/UxdsE2wBFL+cKkIUg/PWzjqE543GAy3BQnrh+
	MwLyEeMDsJcfk07SDFx3sjeyORqaWjK4ni3lxqj5y4CPYWTsJ5yBmLciC6tJtFVK
	zrV7YA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqpuvbcec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 12:34:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaf3f829b3so6077755ad.3
        for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 04:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793795696; x=1794400496; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sds1MGBA7G+Tt49HG3Xil58EHIRS9PXgqNLiElDB5ps=;
        b=StHYqt0zsHPsVNgqRs3gFSpCPuY/+vjENGLcf9QQD7GRMvcPw0avE5rF0WCr5lyThV
         lGu8dt2Z6uVXsK0MV9KeodI0dHvcXlUvMBjfoSar4A0DG+rUbqXLkxzahdZQIUpecfcv
         W5JLKj65N1jQ1+K/hVoJmzlK8KOpquO6NeHCecPlaE5nqymhT6dP6EhSCcSwVHi+F26E
         5OIb+ApWyELbBPOrcsqQ6C1cAUnI/zBe6N1JEYgOIUXCmlpMwp9EheV9vKZkoGOjSo7G
         xmPuNlJquJR7e/N0ALuTXMKsA7pleVXjhIVx/wKLvHbwGLkLwMB+d20aPo+zXa9x2gc7
         I9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795696; x=1794400496;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sds1MGBA7G+Tt49HG3Xil58EHIRS9PXgqNLiElDB5ps=;
        b=y4LRxmaME1YR73R5GvAV+g/qRUC/gM+OJlxUVS5RR0UdUxV3twPj5VoV2KfCVfhBd8
         oe/6gmfNzX09sHOyKQIX/h8slOSyRcSppmCQNyHUQWGu8dLOgZxdztVOmXFu5nRxO4mo
         5F8KzVWB+L7ebQN+Czt0dHgaGUoLpZ0jumBZ+tsYLqwHpQdFvNKMWsflIM2th26CMvFl
         HCJMyX6XFS4st7WZcgzJbCpXU2N4veofKq9TBKim/iKLk7T+VnP7OzoLdyXYYV8KR5fL
         56Zz7yXxWiY/fCWYWe8pxGhKbU/tnHje2pzN7r+peYnMnE4UeXgJEwzMfhRnXKZ6METQ
         K7xg==
X-Forwarded-Encrypted: i=1; AKwUvBztR8Cu2Iddndb/X4sgC1FjW2QfQMyT3pGc8bh7KKb7LQpGBA5gIj/VTwMwlXvwws9ta2w=@lists.linux.dev
X-Gm-Message-State: APuU4Z+fXu5afNoDPOTNwo1sZt78D9UNQZ99c9sNZcZ+aS7sCJPu0Zmh
	DEdKZKwu0ufa3GAeIkRz+szddp8O+0AyRtswDjkDC0xt8kzlOd6BB/OKt3q/T3+Ak6uNeIBtKrh
	zLcnyyYHo9a9SCcVqy/Y2AuClVqyDgAqfg7LMKo5DDDwdj3tCzuLio+I=
X-Gm-Gg: AYBFou1GnyL50HKADG9bvtv9Otv0uR9wNMfemn+mBTVuJYRvm5hoQVwFdoasTy9ZZL7
	X2GPOvtp5Y62Bey5ybqdlcXquddq+C+Fs02JFSAzoIUNPMStKgb9aBV3cMh+DGZPbItMwEBAskb
	+nX/sN60TlPJSHAssPVdp+ORflK2SI2tQJMXJvqLk6L2t4SD9QBWcFHMBh2GgIrRzs5NY6iW48b
	bPitn+kdArwv+w6AvoOFBknQuK4tAQpHwSiSnwC6sWOzE+1TX3IbItYZ1F0L+CJbgP+H8Zuhyvp
	lQDzOISytUg8WiP2jL+Yae163uuhuGCfIcHj185tawfa3tSljlDqo8qkRKrvIh0ZCnqMTAnP0s0
	r9bmoGDR7L8mSCr6ExVsPuhFVrw3UCoX4amKDiYWLp9jUhFbltBXaT2oXfHF3EWpYqfRK5xvXfN
	KPAMWoqQ==
X-Received: by 2002:a17:902:ec8d:b0:2e2:ffcb:87a9 with SMTP id d9443c01a7336-2eb3642fe66mr137002445ad.24.1793795696236;
        Wed, 04 Nov 2026 04:34:56 -0800 (PST)
X-Received: by 2002:a17:902:ec8d:b0:2e2:ffcb:87a9 with SMTP id d9443c01a7336-2eb3642fe66mr137002075ad.24.1793795695582;
        Wed, 04 Nov 2026 04:34:55 -0800 (PST)
Received: from [10.92.198.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e6asm7038525ad.22.2026.11.04.04.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:34:54 -0800 (PST)
Message-ID: <0face2f0-deaa-4a3b-9e81-de68f206d2d0@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 18:04:48 +0530
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
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <3a5ff85c-0629-493e-baa7-543958764219@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <3a5ff85c-0629-493e-baa7-543958764219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O6SsLx9W c=1 sm=1 tr=0 ts=6aeb2671 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ex46fzmS382XuAsv_c4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: asfBq1AVblnJLwNujPb8p_UMu3wWq0lq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfXyaST+GlXx2d7
 HV6LXySkgFMpywC9Kt8G10+0zFyK/fOBub+ODvfg2KDe1JO/YAIRoMocbcRkuLB1/qxYqBcibZg
 gOQNsRzapZlOPkTJj3uLnCQHPQ9SZ9Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfX7PPj/L18/EX/
 YxKP9m8IojAD+xiXQpbdPoojqkHVaa6yZ6/8XjQcMgQffSANfBMdLnQ6tPCkINct3MDPUj89aZf
 l6ciEwuVusWrd3vZglzr/1+YQM7ofFfqLri4CvYsV1yERRlYd9183RAMCDxpdYANkcQPU+PSDAZ
 NDMlJoWSVy25+suBcfMSXuiCHtBmAuRA7Feie/y3glmVujxWm7ChHNl11Ku/crG8/7wvgiz99Ny
 RZN8nyirEI3wkTCwkvGzUfyyjdASteZOlKRG3D9fGzkN91l+6WbTOTxQJb5pdP+hicC/KjZLiex
 WwijfpClC51lls9xfVm/YQoHED9juJBOwsRs0/9FqlpfrgUn8ZZovO+Xpll2UVi+FZlda4O8Kvh
 nRJPsduC4gypDz7PJIRg4IUYsOK3+oI9lOBg7CEbdjtpkFoBbA0chZngkL4YKz9wzhTpDlwZo4/
 NQK1DMcfjYSjZmeJ/DQ==
X-Proofpoint-GUID: asfBq1AVblnJLwNujPb8p_UMu3wWq0lq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040050

Hi Konrad,

On 10/12/2026 5:01 PM, Konrad Dybcio wrote:
> On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
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
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +struct bcl_alarm_data {
>> +	int			irq;
>> +	bool			irq_enabled;
>> +	bool			irq_wake_enabled;
>> +	bool			shutting_down;
>> +	enum bcl_limit_alarm	type;
>> +	void			*device;
> 
> Why is this a voidptr?

There is circular dependency for struct bcl_alarm_data and struct 
bcl_device. To avoid forward declaration, used voidptr here

Thanks,
Manaf

> 
> Konrad

