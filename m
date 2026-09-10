Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A385E3CC7CA
	for <mfd@lists.linux.dev>; Thu, 10 Sep 2026 09:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031446; cv=none; b=jg0rO8BeF5n8Cd4t6Hu8tA33G7HMGFygIyP22UOK9Bn6RhSBVc3awr7wOfuaRai5dq8xMoeY8XzH19uXsj3x+UD6WMbwuUVRQRz7LEzkXh/lpDWV5uG0CkmOVCKnwwSaiKOOeqpbc1OUlF1mAy+ZH3CFgRrt3DDT1W8CKdPtpjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031446; c=relaxed/simple;
	bh=teHhl/Fby6UNaiUms7pOdB1pdpZxF3cZ+JUc+QXjPEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ol6x1cWLlvMJwvg8XbCwzYyhZmQQgcZaZJ2DtQe+7dCR9gXZjZ+4o2+s1M4ybioMv8caMUfZkJGOiM0KgcQSqK4CfgmmLLNM/XGdtnyc5E6WmXIY0G0dIDSRja43NIMzagwL6ZIhX6uHdHMADnST03iSCdFR4i+Frkt0O4DyR6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHC8r3db; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LMpysJLz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WHC8r3db";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LMpysJLz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8q5Kb800363
	for <mfd@lists.linux.dev>; Thu, 10 Sep 2026 09:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YTmrq1APQy8GHJDjSUGwA/3yLK3U/llwtiKi14Y0V4w=; b=WHC8r3dbXT6XTEOi
	A8+5/DD9O80VBFGzL8JvCr/tQCt3ysheDA6K/AqH4mWoN9I7BWSCIsqnpo/k79zs
	C/pyhmnMEIw9n+inmM+uVJ6bzIr0yv6al2TGqeFodbXaFr0vxL7utPxP7RnteKPR
	qm4kGFxqtjHa9a2dGeQq7USgwEe723Y4I4iKVu8uvYcjMCMY8v9ITJDjxIFwmDld
	IWbxa8fI+Sdw1hindEN8FOzIpVybTDotKkFKer62MZov2cOhiPkNr9TyD/FCWM30
	QKGNhRN3dRA9r5i1mLWRqTl0gUaw3bVn1+hTOpIIdCYJvFNrF6OwrljId1mJFMWa
	3aUtug==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrcjrb7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 10 Sep 2026 09:10:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dcfed75f77so28566055ad.2
        for <mfd@lists.linux.dev>; Thu, 10 Sep 2026 02:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789031442; x=1789636242; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YTmrq1APQy8GHJDjSUGwA/3yLK3U/llwtiKi14Y0V4w=;
        b=LMpysJLzUOBaGKjo5EkAOoiAp/BlwF3HPrkbkZcqkZ4nUSIG/kvZgl3rgKZ42wD0pJ
         iIIL3QRHlI8akpeMNhkUMak0luiG2g7/oVxnEIPSF73FrmD/lf0qSpMx8EM+hxrepZT7
         7JOflcp3PAjkQyWe6udg6HgC2IOIe3qT0CJglFwYu5m5WHVbbnjDYP+EPvWCSC7xafIn
         D8sQ82lpwX0JFolYE05EUSIrzObUwWCdH+fBVcgwT2+SJ9m7ebvkAL2L3LAPLL5P499J
         MLMOAZ7V79wY822BdM57dyfRUHYTZnvPtSPKDPHjCZQ7wn/mrNgt8+WPyQdetIth6bRt
         +/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031442; x=1789636242;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTmrq1APQy8GHJDjSUGwA/3yLK3U/llwtiKi14Y0V4w=;
        b=NiiGPHFmshQAiLIb1rgOI+x/GUnTmVQmAk/iJWBFzqyHPO1SUuxwLYA1AxmbILIcWk
         o9UlloGpU+b9wQErk3znMHtP9LzCaWu1tMXsjkE8zOY4E2SkGxUQho5987CqdbIPey5s
         5Rd8SgFRj6pjMPzqCUfYY8oJ79n/FXqb3W9uLpSrAdZ56eNM2x3Aq18gtNDm/NXuxcD+
         rbhJUk09Yi8UHBctgFEyfj1QCIorYkiJIT4tarDTEtu0nIlYANmLG/kEaYaVvVIpemfk
         oZJD+FQUTFTqVPVkxqkG4fieN6Kk7MoOs7U7s2dJJJeWF5c2rPPVpeeoPv2Hp8r/pIfW
         /ioQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNa1IPOHfUlVtsefIyoXPHmQaItSEcSt8URi5F3vvfamnbmoHIAioy1u2qweiWzBNMryo=@lists.linux.dev
X-Gm-Message-State: AFuF++mXBlDngWubBUX5kyJ/LrM0ZO8sbXa+6BRz4bHrYy/0dp4UVx/d
	2eUuuGSa1jNkJJtaIEufcyQofXSBj9L7noRKx2jVxm0PtCjToip8ZXjiPUwiceXCPXRtueL+6Is
	WYIh4hIVx7MD/VKGq4i/vX1VQpa3Q0kofuU/M8LWiIGwla9Pb3vaJLE0=
X-Gm-Gg: AYBFou2zbqtBUlCssBXENlPFA2yOxrePm2hdivXj0QK+SwRZwXlmzx4wWmnxmxmC6bp
	AA8JiI3fm3jUIVUzcllH8jLMGUymmCV5+djEWcMj7WW60rqbrer9UVHJ1nW6MxHsTcMy7c6OXwa
	NkG8GJs1oqAq/8JVwiy0NcuvwGkB2DHpQkio/Jol2ZvhM8EUreR7h9/9ds8AkfCCWn3hr3/sDf1
	AZ7mn/XPUgvzJ0tk+IBVOkBW7D1TF1Xg3vMWx5BBn6vy6nJjGzXPOZ+el/eHLYuTMPaQR/tQ3YL
	bK61GO5LN/SEes+7/HGWMrqJdvvhtWbYsnjzphGFERBMyLw3t58eJzyH+iIG2eaP45LqVP1ZbFb
	5CnCVD0MFVJmearzcHGfsiO+g419DCg==
X-Received: by 2002:a17:902:e54c:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2dd07320bb9mr93831925ad.0.1789031442335;
        Thu, 10 Sep 2026 02:10:42 -0700 (PDT)
X-Received: by 2002:a17:902:e54c:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2dd07320bb9mr93831005ad.0.1789031441760;
        Thu, 10 Sep 2026 02:10:41 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm78910994eec.16.2026.09.10.02.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 02:10:41 -0700 (PDT)
Message-ID: <f7af73ad-f09b-433f-929b-cd6d22e2afd5@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 14:40:35 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mfd: qcom-pm8008: support PMICs with no interrupt
 line
To: Oleg Keri <okerixx@gmail.com>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>
References: <20260908130745.2545-1-okerixx@gmail.com>
 <178887481187.4612.2819576206036967152@gmail.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <178887481187.4612.2819576206036967152@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEwMiBTYWx0ZWRfX1mv1l1k/iXLV
 9E8aIaU9P/h2X53pNRq3Oh5qWKqtKxuO31iKR3/m/R9E4oDhYpK5AVPVrX6ejV/GzPsdAfPfmYY
 lG/KtZR6bwDB+OKgQZtPz/kutwkbU80=
X-Proofpoint-GUID: h_7CyT0R1KU0MZJJGmZ9BEL0P5XUMLVp
X-Authority-Analysis: v=2.4 cv=aef0Dhot c=1 sm=1 tr=0 ts=6aa27413 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ty4ZCte2KelZnw5hmtsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEwMiBTYWx0ZWRfX/zLrTnpZOjvA
 /WZe8NGUrHMn4lAGuoplXpZr7S30KJNAV84RA2bdPBppAJPNpPfCcpFffJiv2JdCMsdLAxcweGT
 EiVTbpNJ2PTPYuPxZvVVgaNI06jzLpA2EUJ/iTjl3WvZ7Pdac5HUttRXx/Ofu7BsbXu1SuC5dyU
 IDLxsv2lx+vudReS6GhEl59AAfcQfdT1brp0iIdUMUr+Nqb8GsIkj8ECKh3QHgWyeJYqjAFYes4
 9Pac+OOnTpbqIQepq/BGgYHmMc7PZ8m73/Cr2XB/JjyUho4H4X9pUb9w5bSS3ZiiCnsNNgFGkBw
 4+6aKWoNcCU9aXrt0kR9pWQr+SJ7S9EbuXnZYODipm0KtA6RwlBo/ghRwZXZQbbaZd7mcAdHX8B
 Yp54xGQMPpgqkN5wikv8OOOsCkO1VfD8wT7dPaRQiUFxZMdnOhvDjt75USfn6lZYE0nj95NSLpp
 S68HbvdYEo3ENWzU09g==
X-Proofpoint-ORIG-GUID: h_7CyT0R1KU0MZJJGmZ9BEL0P5XUMLVp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100102

Hi Oleg,

On 9/8/2026 7:10 PM, Oleg Keri wrote:
> Please drop this series.
> 
> It duplicates, as a strict subset, work that was already on the list a day
> before I posted:
> 
>   [v2,3/6] dt-bindings: mfd: pm8008: Add PM8010 I2C support
>   [v2,5/6] mfd: qcom-pm8008: Add support for PM8010 PMIC
>   https://lore.kernel.org/all/20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com/
> 
> Nihal's 3/6 relaxes the same required: entries mine does and more, and adds
> the qcom,pm8010-i2c compatible; his 5/6 already carries the no-interrupt
> path my 2/2 was adding:
> 
>   static const struct mfd_cell pm8008_no_irq_cells[] = {
>           MFD_CELL_NAME("pm8008-regulator"),
>   };
> 
> on top of a PM8010 IRQ chip, match data and a pm8010-regulator cell. There
> is nothing in my series that his does not do better. My apologies for the
> noise - I should have searched the list before posting.
> 
> Nihal, if it is useful: the Lenovo Yoga Slim 7x Gen 11 (glymur, DMI 83QR)
> has a PM8010 whose INT pin is genuinely not routed on the board, so it
> exercises your no-IRQ path rather than being a DT omission. I have been
> running an equivalent no-IRQ path there since 2026-08-25 - the LDOs
> register and the OV08X40 works - and I am happy to test your series on it
> and send a Tested-by once I have actually run it.

Thanks, we would appreciate this. Please note Mark has asked us to split the existing
series, so we would be sending out separate patch series soon for CAMSS support
and PM8010 support.

> 
> Your 6/6 also shows that describing a PM8010 as "qcom,pm8008", which is
> what I do today, silently programs the wrong voltage ranges. On that board
> the sensor takes dovdd from ldo4 at 1.8 V, and:
> 
>   pm8008_pldo_ranges    1504000 + 8000 * n   ->  1.8 V is selector 37
>   pm8010_pldo_lv_ranges 1800000 + 200000 * n ->  1.8 V is selector 0
> 
> so the same regulator-min/max-microvolt lands on a completely different
> register value depending on which compatible the node carries. ldo3 and
> ldo6 have the same split. ldo2 and ldo7 happen to map identically because
> the nldo and pldo ranges share a base and step and differ only in their
> upper bound.
> 
> The camera works on my board today despite this, which I would treat as
> luck rather than evidence that it is harmless. It does mean your series
> fixes a latent bug for boards already describing a PM8010 as qcom,pm8008,

Just asking, have you noticed any boards doing this currently ?

Thanks,
Jishnu

> not merely adding a new compatible - worth a line in 6/6 if you respin,
> since those boards need the DT change and the driver change together.

