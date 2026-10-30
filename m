Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793345630;
	b=BTgK70IljYV9dZMQxQ6RoyWsMzGtXNphS0fOWlu+rcST+5u5BxpXVn7JQ8UfBW2IL58T
	 nLYyLuuP3baW5SSP4f/aVVgvFElQJdrskiQPVhAv6Y0XOgVIwlGR9r10ctPP7OMZvyKoU
	 72mKpwFZ2hIo7/t6YhkSd0IC/Y+S1bYltKUYyOQR1xiGdmwkvGIojUyKDVZiDLmspNn9F
	 VnnCb38vVwGOGf4hkAlwdCnuNN7rsnhU8IQ0+bRjzWlAMItO5u8tADPdahssp13O4xPGF
	 +0R9XAYsZvPCbUS8VBXhDwDhowESWh7N/N6VDvEHfJGy3Iv8JYsuXqnBoh/R1oLWdgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345630;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7XJIAhiidxeglvGcwqGX9Zevy6cLKtQ1yDQdXG6Swds=;
	b=3w4wAvW02M7cv86LM1GWuYj5NPG3uTh9n5mAfBs61nKHfVRsvRYbxaewRHz0STkjBPMz
	 4bxdfYl6RqkbjGabNlyzCRiDpqETcYZgoJ32bst3OGoe3MU/0fwyhcSnEAvzdgccbYBgj
	 7fTzD0Eu9AgQnnfbpgo71jFNncRSv1qZwK+xRb93kF4CpSigJ5m5aTMNxM0oI4CvcB46Y
	 9y49U5YkFsVjOTHRUwnsX1truekqQ8eFqZlqGMwGM2yCWQNConyGlrofdMU9c06SuY8r8
	 mHHLFIYnV6J3aVhNmCVkEGKMI1X0gVJYvLh1SE13iQC9rMsaa3f2yxU0Ehhshih8fLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="gY/6Mmo1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MCHzqzjm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1139C606A325
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 07:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1139C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gY/6Mmo1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MCHzqzjm
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F5im2287043
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 07:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7XJIAhiidxeglvGcwqGX9Zevy6cLKtQ1yDQdXG6Swds=; b=gY/6Mmo15swaovij
	7QMQ3lMnOhPfkyE3bAzID94ZAShm6ILrwGaluc1tf9/fKPL5e+jOHUDCioCQKEUl
	3rkgFh6uFVnz57nnnlpAObCIGHcHLAayL2VCxJRL0GL/5Y1Ob9seGONFIvjVUWnJ
	eSkrfdjkHHaVKmCiixMu/NrrPm3uy5ryWZ4iAyAHtOr8VMefaRS0e+c7Bv3ULRic
	Kat5L5TBjgA72YHB89NgDOVLUpBylOFiwJlVBl4XMZlAK/3Xye4+MwfzBztMtHtL
	VsDHDYm1pwpPEiaOIc6s3JZOlm+w1KYtKq+PDQUGaTa/dYg2jnSBqAxXO/mtH4uo
	JP+s7w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhsug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 07:33:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844e383so64691385a.1
        for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 00:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793345628; x=1793950428; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7XJIAhiidxeglvGcwqGX9Zevy6cLKtQ1yDQdXG6Swds=;
        b=MCHzqzjm7nIuDhHIg8mb7+tx0abvPUgW4wjZ7+Lcl0RUVzZ1IftQNDwkciBGWEeb0L
         tkfTZWzXNiLLa+oi/PumbjWTah3XZXc4MCctf5soq+GDPWeol+Ov9p/B1PDztumAODzh
         ALxIlwu/hvL7Ok86yHqt2MpgtT/vmdy2HRZGpTEB+c8KYeYdXqn7FVsB8DOnEtLQNb+s
         /YCCbq/5BIq4fGkPf2TxhFBFLC78F/ZASD8Eoc6uCuu5y43J2dqmqawVjKW3eGKAuCKh
         GBUJGR4c8In9GWOisc1Q2ufYGDEYr/K1ZRgybuEAoNhiHgnCEKuwk9MoDysxAuV4teq1
         FZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345628; x=1793950428;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XJIAhiidxeglvGcwqGX9Zevy6cLKtQ1yDQdXG6Swds=;
        b=Lnw8TrzpuDHEbLGB3EX7K8Fv/HwTrARxq35Ee9mK5NJGdgPXVseaCp8MwG8S007imM
         RIdJe3x6GFkR83STrUyPw8rs2PopWHrySmn8jr8KPFYyO/xpDZ5l3CGSAYYHR6hsl+QD
         GnztP0tnZsqRZ6iHoP+K/YjLK19sB85dLGYQosq1B6Rj290krriGlNFhmxRJEJYenFNF
         OvG/ZEVeh/DJ2mw2NjSL/h647eYMQgQiDAG7seMgm51yGF08W2k6S/MbHkDk74EmJ3Nw
         twKro6vwhHjBivJrMzIcXTZeEi/0LCedm79wLj3hniX6h9cT83z/bspswYtvK5QlmX/L
         juuw==
X-Forwarded-Encrypted: i=1; AKwUvBwmY+JibJj2viHEK1Cd+EInI512f70hTuHNTFlcSOArrmQ1o5P/V1uUYFlTFbDXOcF9zIw=@lists.linux.dev
X-Gm-Message-State: AFq9FYKoarxvNdDlXCyT4V+Ybk/ANSP6I/hQKShncd3lrlDyXnU6Pqy0
	3TZIseDPsEro2uPcxrW1cCrFFMQB4/7yorfvWDtEHeEde1UIuLagCJoWH6oH3+JciXL1emVn+CO
	vdj0o5Jc2Ly6gK6NnaAwX5HUMJYu/YVQMQnH219ji4z1kAfkZhLpvwCw=
X-Gm-Gg: AYBFou0az8cbfZadU0QBrXkFMcMrrHzU3sIPJCZkyHEpYXWYKbcF4C/k38UB4wwT5jA
	ASqr4UIMIB1Qy4hjNO3x3NHdYZJwZ2A2wIJXDSgzKQ8770+Ca/6gcYl5tBmEwxoDIdc5f2f2jjF
	vvJw2kJFdPvzi0Xxd6mDbwpFGThiDiV0RRmsupx7xgXG6XYtiDfvib8no+shGcZZ2VW4hhqUS4s
	kKyFI1TsuYLE2pkJ+56z+rj0rcwLk+M3G7oEU6EPNFabipxbLgsa8GxzxIZdd1IwhC1X9Kds/Qy
	7s5DplS5hVpZWaRRaeQjbitOW3N/0dvUFtAWhPHheKRVqTjM7YKWo7p9E2uupvRMZuQHIL/l2Mq
	DvKQRJ6YHiYf0Qc9Y4zZlcqKxMfI75nFjD/5sxtr7UnP0lCr3IJ0kxaAVpeD7fbxclnZBLDYrWc
	o=
X-Received: by 2002:a05:620a:17a4:b0:92e:bc28:5479 with SMTP id af79cd13be357-944214d169fmr270107885a.2.1793345627980;
        Fri, 30 Oct 2026 00:33:47 -0700 (PDT)
X-Received: by 2002:a05:620a:17a4:b0:92e:bc28:5479 with SMTP id af79cd13be357-944214d169fmr270104985a.2.1793345627393;
        Fri, 30 Oct 2026 00:33:47 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71baa1b3sm1652381f8f.56.2026.10.30.00.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 00:33:46 -0700 (PDT)
Message-ID: <89a22b1a-2c72-4415-b3b5-81acdd5dc171@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 08:33:45 +0100
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
Subject: Re: [PATCH 1/2] mfd: Constify mfd_cell arrays
To: sashiko-reviews@lists.linux.dev, mfd@lists.linux.dev, imx@lists.linux.dev
Cc: Frank.Li@kernel.org, lee@kernel.org
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
 <sashiko-outbox-190635@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-190635@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5P-uhy7UxFB84Ferb48YNX3_edDuSOHE
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae4485d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fELvzImDkAvHXwbp4t0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyOSBTYWx0ZWRfX6XUFwzshDlrK
 DCbaTuxzHOyHI4rmA+lixORf26xTgiwdzyQHnOHpyesp3gBRA24d2U7BsLQ+CKHRFnMe7Uy2Kgv
 eUNiAXIffgtRKGjU37rE/JMjHdkguDxXSPgmwABekFlxxSVokVjiHLgx4ft5suUlImA5kl1J7PP
 6mfpTHYhY9AhhIIJRtMqgiSMzdqg/jlEX71b0npOe6ZUoBfx3LwS0x3NHqqBG0vcfMF9xOzbP6s
 29LsAElt2mgXUHveQ7w+dajB0VBEssjL4NLGY7ZV11WxwvNNYXIfxWbzE0ci/E0csTkQGkwbh1o
 WVo0WwFICnEUpi/Swv1P350AxtgO/EVyYGRXsoUXBtZS8FR5EmoT65lkg4OlGsmDoFlOyHIyxYx
 fZvbpNRHHMMWOLpNkUv0bwLKSLtUOfBAgGJB7M9dyXNBg2v88831VTCtmqquGVuSAdDaWvqE9zZ
 3UdWIROTO/ulzAD9wpg==
X-Proofpoint-ORIG-GUID: 5P-uhy7UxFB84Ferb48YNX3_edDuSOHE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyOSBTYWx0ZWRfX0B3xTtvs4gQh
 ihQi9b5f1aaS2waFUscLX92pwW5ko5gGlhlYI6eeOlQLi3Oxf3oV047HB54Or7QnvEMhfCRfslX
 2NLVsNbeyBp8ckajKoKCpNEiRjSnnLU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300029

On 30/10/2026 08:17, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] mfd: wm97xx-core: rodata write and const discard in wm97xx_ac97_probe()
> --
> 
> commit d1e87419971e113856988eb45a5e61c55d61ecd6
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> mfd: Constify mfd_cell arrays
> 
> This commit marks several struct mfd_cell arrays across drivers/mfd/ as
> const so they can reside in read-only memory when passed to
> mfd_add_devices().
> 
>> diff --git a/drivers/mfd/wm97xx-core.c b/drivers/mfd/wm97xx-core.c
>> index 1566a9b04b6a0..c0ddcd5219b57 100644
>> --- a/drivers/mfd/wm97xx-core.c
>> +++ b/drivers/mfd/wm97xx-core.c
>> @@ -104,7 +104,7 @@ static const struct regmap_config wm9705_regmap_config = {
>>  	.writeable_reg = wm97xx_writeable_reg,
>>  };
>>  
>> -static struct mfd_cell wm9705_cells[] = {
>> +static const struct mfd_cell wm9705_cells[] = {
>>  	{ .name = "wm9705-codec", },
>>  	{ .name = "wm97xx-ts", },

That was not supposed to be committed, stale worktree. I will send v2.

Best regards,
Krzysztof
