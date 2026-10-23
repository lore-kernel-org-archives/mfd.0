Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756949;
	b=OP+lxLbYS6/8wzJTu4M6QqJcfj6RUoOAJ5TGNT+8JZB0nod9OV2qII4apnifVqtpt3FN
	 W3nx3rbwRLvBtysjFoelVcS/IoO2ESsuoHsSm3kDuEgTvWgVucoQkbdVwp7ju+CxuEPmI
	 Cb2NsHdKySxPh5Ff49bRrAxEm8yhYMKc38yd7SRWN/UkoHbimMz9+y2JdeWCh+gAySkdr
	 UWnAk5vdH5Aw7jefC9LXI8yrOuIkHTBZcAFCgUwBCgZeo8U+8+o8FOlnkdMZtVdpidJQS
	 PtOFOAR/JxbAzCberH4kyUSeaSti4UHAebVjGEWbHADi2j/zHG2l9QRrh0aP30NI27Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6GGmdXvwIAnulrKf4r+LcLf1PuI6wwGvA7L6rMhArNo=;
	b=nox5q7NX5N/gzgl/eetytlLgUSa3hR08Lvg3v0UCMPKknTiJiWeG3gyfZEK6opG6T2aL
	 a/QwJOi/atL0nANMUELGqYbNTRwCG3ZgLGOFONr2w5g3ZuAo3kxp5KKueZdTUpwui6mz/
	 t0DzKP2DDFW9TG5Qj/SVqcJ7XagpYRlDXfZ3HdLyUclpCEoA5et+SQPOwIwMRGEvtHt/p
	 Zln9EY56191/m0TkHe+cGibBEY0wlegzPMkXniWzRlebkUX8VxZUyP+SDZX6U76g93ATO
	 jaIm7Vi/2vAn5BGvxaNyNVh3iqBvNjBTz/+tXOLaGlWC0Z0FSvJ3Dc6OB29nDW6p5+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZgouW7ox;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jRPnFzUa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6455E606A31D
	for <mfd@lists.linux.dev>; Fri, 23 Oct 2026 12:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6455E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZgouW7ox;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jRPnFzUa
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAZ7V1948506
	for <mfd@lists.linux.dev>; Fri, 23 Oct 2026 12:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6GGmdXvwIAnulrKf4r+LcLf1PuI6wwGvA7L6rMhArNo=; b=ZgouW7oxVzfUAKZQ
	KOU0IWzlrr6Dubt2hR51UJT2qwDOEn+P6ShzEQm7KKeqvELfky49nvxULxXPo1sO
	MRBbZixXOE47+6dGMHosulbGpEn7aFALGJfApvVx/IJF96X0byW9h8SUmaOVobIV
	c06BsVXT9FIc9iP/8y9aSmzRp32MHWOHr5gVxuEYhsXVpP8ZV53NnjCa9Amlv/7c
	sLd083BmST4gquvl5Vaj3M6QwL3S7zE5y+ebEBeFdzRqPQlg43Pm7CA6GeTAu0cg
	HQWrgG5MInG7+AkPjKOAEHCYmirtmCnuaQyUZP0MbQDZqQMVnLcymKzA8eS45pV2
	BU8Yqw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtujqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 23 Oct 2026 12:02:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dfb24dfedfso8820945ad.2
        for <mfd@lists.linux.dev>; Fri, 23 Oct 2026 05:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792756948; x=1793361748; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GGmdXvwIAnulrKf4r+LcLf1PuI6wwGvA7L6rMhArNo=;
        b=jRPnFzUac6Y+otH03O5xqV0p8ENvHTPutfPKsbU28IxROqlXa4kX1IGeTUCoR/1bXu
         4epfxGKe2GEo+jdwt12U02vWewVmJLYBTALPumVDbwGDPZsKkr1cBcKiwisM4+/8973P
         egtJwdXxoQvArP4DwyK4iTi/e8O6cTm5MFXvWsnyunfkSpeCzZLgQf572xBqTfRtBNoJ
         9nt0Xp4cGUtZH3Exeyud3l1VABYy2uYbaDhaOOih2BP8BxrODKbM3WW9YM3HdZ4E2Ila
         aNB2cnlU7qfgPY2NYTtStCQvCf4kxhID3NLG3Nn9Y7t0E0kcPs8sMy8yXF4+sbv8/2aF
         oEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756948; x=1793361748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GGmdXvwIAnulrKf4r+LcLf1PuI6wwGvA7L6rMhArNo=;
        b=T4fN1KkLVJvcyIRBj2siZv2qr+oMO/whaael0/vxBZC5Mx8QWILVEFuwz/CUOSgn+G
         K+T/leCRjewRlESQ1UqDVjVoV2R05lOtzm6g8MFcGv7I14fDb65GNZd5j9Xl/y2vjKBm
         kCcrLhOGWEvpPsiGWf5KG8Fv48V/SacaCdabHaHsf7VrBxgVzOAIVvvr/ewB3ycNvFCR
         lA0F9YxIbWTnpGKtVTIk/fy8ZL9gkhPpYZXLDnhPKXHWP2ofY7WOGFpWPc/akuduWsdk
         G7HP3cB6XMtYwukhmfu7QPLxewjmVwm07AbFMkQiwmkJU4TBSBl16lMcjNyRNx8yUWWz
         bEMg==
X-Gm-Message-State: AFq9FYKLSP8EIqP1oCIiof+vnwsOn0349axfJEkx673CmahlPHuhvgxf
	ORxEmHGTuHvOlRpYTTgtPVj5AhawchQGlHH6w2VgML3bYYYwpF8rOAVAPUf17BZXG2Fe2mTZoNm
	pKcADIxx0R7EqnngWp9QUbVBvXzQ40gHKvAI3o2wskhqnn6Sdv9K+2yARnnL/hwk=
X-Gm-Gg: AYBFou1NwatJudzm/B9E5vekAyguooxNlh5GwW12IPXAM4Q+GFbIZVflYU3HSFgANi3
	6YZjejOAoGF8hUn1SopJb2jhrB/VP+Yu+1/fiEuXtTJQNpY98Ihov8aTc11LcqczUISpPWzerpo
	F1Jyk2eyxfw2+rw+rfS2r0z7FPJPCuuKUkwiWzYa9DHfVYhzzeTpyrmA0Ozx78dj0IXmplArmDH
	Y8K2CNuaeEKnHxmIrrEHh5nAbNMuLaTVxt/XlIu8tGZ9oR0MOEVBsG2IuQKzJ+yWmzONEzG3VTX
	Ete9g7Ag0Z/ayuAJWFJQKUDY7Gb4SK7P/r3XfCX+WnR0UO7Jy15Mir3rpbfmBbVQEugCjhzwgdb
	V7Rm/yrYcLlmHVESSsdlyimIosnfa
X-Received: by 2002:a17:90b:1350:b0:3ac:b3c7:de14 with SMTP id 98e67ed59e1d1-3adce136cf1mr1516507a91.61.1792756947628;
        Fri, 23 Oct 2026 05:02:27 -0700 (PDT)
X-Received: by 2002:a17:90b:1350:b0:3ac:b3c7:de14 with SMTP id 98e67ed59e1d1-3adce136cf1mr1516163a91.61.1792756942520;
        Fri, 23 Oct 2026 05:02:22 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3addd6c20fdsm41656a91.11.2026.10.23.05.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:02:22 -0700 (PDT)
Message-ID: <a8db08bd-a92b-4c8c-a9b0-0a637b57cf0f@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:32:18 +0530
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
Subject: Re: [PATCH v2 4/7] mfd: qcom-pm8008: Drop GPIO support
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, lee@kernel.org
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-4-b395d2b3f668@oss.qualcomm.com>
 <sashiko-outbox-171157@kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-171157@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb4cd4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=b4OPtKER6HTDepoTwoAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: sXeuMDcR3ZPfJKmUD-ZjgouRjQtZDO0-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfXzEr4WF0gPwHL
 i/xLzSntfkdVT5uS8gcFJPigA1OGpAH9Wze/MmtFg99moFdAeSkqWHJNelTN7ixET+yP6zu3brB
 oeTTkfj3OaEusNJVE01Rv2QNP8jZ1Ddl0BlOZDXdaCuqiqztNwenESR4Y70RWFH4y1/1Ue9yANE
 9bCHNMyoIyPT14yxhEZ1yLko6rF+ZA6qAk8t/HkImOARWCeZ28ajss8MKYq+PQn1wA3mKfSAVQs
 ejLyn38ia2weCx1O9y/YJtoOrwkbE98/f7Xo399/X9o+LHbLxZneyAQPDmSFpGmjWxlqjUZccfu
 UnyBQ/unzrWUHSO9CZOKGjQHdh5WP11QFBYqyUvAF7ZYWZmB3Rj944GWmyAT5NB8smfK8D24yDf
 aF8icfWLbEf3n9ShIzdosYt8rNi3Uz0f0Bn2w6NN9LL/031+TQJbphMSaMQpotMK+OPPSDkJ2WN
 rbaVMZvq+o9zAOZkWqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX4N7/caxz3Tzm
 saDI63q8NVZkYxGLtXNEj/1vsHWYIGDbL5kCR4Y3ZJx/joYxFQ/PK+Axa8t7uODdA1oz3aoCc3m
 2Fpu1UoXzHAFPnAAiDOBSk8hu+2Rk1E=
X-Proofpoint-ORIG-GUID: sXeuMDcR3ZPfJKmUD-ZjgouRjQtZDO0-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230046

> commit 8f95e31f13fcffe905ad6efeb0bf108998166be9
> Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Subject: mfd: qcom-pm8008: Drop GPIO support
> 
> This commit drops the GPIO MFD cell and its associated peripheral and IRQ
> definitions from the PM8008 driver. It removes the GPIO elements from the
> peripherals enum, which reduces PM8008_NUM_PERIPHS from 4 to 2, and truncates
> pm8008_periph_base[] to 2 elements.
> 
> [Severity: High]
> In drivers/base/regmap/regmap-irq.c:read_irq_data(), max_main_bits is derived
> from chip->num_regs, which is now 2.
> 
> Due to an off-by-one bounds check, if bit 2 (the dropped GPIO1 interrupt) is
> set by the hardware in the main status register, the check "2 > 2" is false:
> 
> 			for_each_set_bit(b, &mreg, map->format.val_bytes * 8) {
> 				if (i * map->format.val_bytes * 8 + b >
> 				    max_main_bits)
> 					break;
> 				ret = read_sub_irq_data(data, b);
> 
> This allows the framework to process bit 2 and call read_sub_irq_data() with
> b = 2.
> 
> In drivers/base/regmap/regmap-irq.c:read_sub_irq_data(), this leads to a memory
> overflow when writing to the status_buf array:
> 
> 		reg = data->get_irq_reg(data, chip->status_base, b);
> 		ret = regmap_read(map, reg, &data->status_buf[b]);
> 
> Since status_buf was allocated with size chip->num_regs (2), writing to
> data->status_buf[2] corrupts adjacent kernel memory.
> 
> Additionally, data->get_irq_reg() calls pm8008_get_irq_reg() in
> drivers/mfd/qcom-pm8008.c:
> 
> static unsigned int pm8008_get_irq_reg(struct regmap_irq_chip_data *data,
> 				       unsigned int base, int index)
> {
> 	/* Simple linear addressing for the main status register */
> 	if (base == I2C_INTR_STATUS_BASE)
> 		return base + index;
> 
> 	return pm8008_periph_base[index] + base;
> }
> 
> When index is 2, reading pm8008_periph_base[2] reads past the end of the array
> because it was truncated to 2 elements.
> 
> Can reducing PM8008_NUM_PERIPHS lead to out-of-bounds accesses in
> data->status_buf[] and pm8008_periph_base[] if the physical GPIO1 interrupt
> still fires?
> 

I checked the HW documentation and I see that the GPIOs of both PM8008 and
PM8010 are not capable of generating interrupts. GPIO1 is used to send out
interrupts from the PMIC to the SoC and GPIO2 is used to reset the PMIC.
Since they would not have any bits in the main interrupt status register,
this issue cannot happen.

Thanks,
Jishnu


