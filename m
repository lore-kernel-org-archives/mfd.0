Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B68F34A773
	for <mfd@lists.linux.dev>; Mon, 27 Jul 2026 15:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165562; cv=none; b=sAWP28zqv62m+sxWtmGhTF2s0xCSj3Q2meZHcls4Hr9RQZH8Ec7mmOkXMFCJVG1VaRAppXehtuBt/gDhsncKq9d6I7f92GH9w+G+yfTFFI2OV8AJ9IMuB3JnFpPjkAjfeeCafoRrO/taG1UsyIl88f69D1a7nugY+bLx3+BI6Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165562; c=relaxed/simple;
	bh=osMTHnsGznPzOgq2+7JWanAZThHaeW5dVV+gMpQPPZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tBQuVmdVm/kQLJaqdoSCLn/IVVPIbY1cRfQUvsLi2JE954CH6mV5XCuYj3UNmnBNWUfgpWEgrCZEEwYwTXjLn3NgCZSL0z6/8JUjX2YWDSZipmnvM8o8SEcqd8kH8BP/qd/dtee1vmd47itbP1ordD+MXC+b26YesR7SRUThYeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lQJqCtDf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fATsR7aJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lQJqCtDf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fATsR7aJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlh5r3895728
	for <mfd@lists.linux.dev>; Mon, 27 Jul 2026 15:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5/Vl312DYfGSYqw8ngN0+bZHTiDTUX1IHF60jNSBHv4=; b=lQJqCtDfjuuRIyX2
	VpgPFvxqytfvdwDrvWe1EvCGXqfNsxrDxkY8CZugU21HFzNYlNcjWdy5bjkn7y3v
	2gFPOf03dECQcn5QWvcKsqfgev8tw4SyZaWu6hYE1BlYackOlQEXINvh4uM9calP
	lB1PneLByRW1oqsbObgdR0pYepoYXZ1PcwHCLasO9NFZ5MmgUyDt3Bs7hRVTl0ph
	lp6mMXWL0rxdnE/84UDijUeS69JhOEbIvw75KrjaQtPgygRvyDrEHY6uAN3+FyA3
	NKBWL3Q+Nbhqx1midMrZi0MI+F67FPMs+9+1hPGw6PR8lHmAY2CyVjzQE13NfT4i
	oSPiRA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs39ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 27 Jul 2026 15:19:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-904ee4473a8so35648516d6.2
        for <mfd@lists.linux.dev>; Mon, 27 Jul 2026 08:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785165559; x=1785770359; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/Vl312DYfGSYqw8ngN0+bZHTiDTUX1IHF60jNSBHv4=;
        b=fATsR7aJXGvvtZsmOdbREggbUzPhc4GaY5yLqJ/ZFM7ERBfyVKsVRTOpDV4XPbjWsJ
         92fJxLI2ip7Z4Qap/9G/QAodXa98O3K/j5ZmyeItsJv6wDQcX9S2jitYizgjboic43Vi
         ywWI7fu4jAE5tpDCgl8JI5SzkeIRcinCdRtmVRS17wdC16mB4sOMQa9CjkdUZ8DPmyF6
         NdHzA8uFZF+RI0sMpvSWswdU2SWUKtLBBUNX0N8bQc7uVI5Oy4U6Y5J21tn42dlofLpy
         Rh6UlZv3n6oWi+2FJ5ytta3Oyew2lPRly3GpHpsor5Ij9LRRlFk+wceTIIJCvWExP6gL
         riqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785165559; x=1785770359;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5/Vl312DYfGSYqw8ngN0+bZHTiDTUX1IHF60jNSBHv4=;
        b=nxvRq/NaXvVAcKjRuYefFSOF6wAbL3Uh5s0O+7QiqmISLbfZ1GZiLK4nq/Z06j7zlh
         bWV5+DlB8jXKFAy33WtGyhgFJHK8e6BcOQgxFO87lEga66YudT0abYl3LoXzXsnqsXJ1
         dJy378wdwhfDMFspjERf6nnS5cdAVgMZmNnHhMf1MR/56xuPEc+z3uXxkaRaaPyUyWNd
         pWz63XLhXM5xb1rMufHtZLozBalE8cGqY+GPuQuuaXaDW0WWmPzYi5J/Gw9daPHFrDnl
         nGJFnMmiD+pGQdXdULUlrRNbPeQ048D+BsXiwBe6htcOwiNp+NJ9zoJkSS0a3MHqo5n0
         sJdA==
X-Forwarded-Encrypted: i=1; AHgh+RrTfzlmskqDoKxW4k/k+HBGi5GthG+UXjm8hE0pnLvqcpD8JHEIBzDTrHsXEFotJH8hpXc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwA2NCimCocbuDuSu0aaaWpNEMDTlCNZN760XRL6O/0jlFhxJHh
	qOsEKcdl2LsLAV5OHMZbGxkXDxy8wFYxOGPEAIigshjqKI7sG6JJ0xJYAkjmeBLs24/XcGh45JG
	EAfDO5W3aOvh+ssZKEkmtQofs6OluowwFHJSrrCs+qmUN17AM0AIpxRY=
X-Gm-Gg: AR+sD13wHemdnczlohORjaWOj1aNmuQfx4E9YoHEdwsazn9hCT4bLkGOWn57256WYDG
	4gjj3Q5kpIgJkC8wxOHL+pVjyYiopVJA3A5D9JnnkNFoZPGrZ9aolm0WIlEEB2oq3dvQYuVHR4z
	qMSjHXHsX+t+hEcklGbISdy4bjopJj+glIhDtUhrI4Z87cEK0WO5psReqdIeosC1GwuZOS5wWbS
	VAhYAwW4Lk37RgH3rtrN7EZ5DMZu3tUgfS6XAqbNJB8fX4BizU2ZjE/2L8QmLhmAt45Dc1LCdD/
	B3Hai7Rs+GwywmQmQB5qHReJDLYRuRt4XWn0OGUjpttvmqmXAIasBaTbnOZlKh76h9Xz9DIgMN6
	lfgkLz10T5hkqulrnrXJV+bPZFT+vEsZzwLz9YUFBybl7Tg==
X-Received: by 2002:a05:622a:349:b0:51c:7b13:62f8 with SMTP id d75a77b69052e-529cd07102cmr12547621cf.78.1785165559361;
        Mon, 27 Jul 2026 08:19:19 -0700 (PDT)
X-Received: by 2002:a05:622a:349:b0:51c:7b13:62f8 with SMTP id d75a77b69052e-529cd07102cmr12547221cf.78.1785165558959;
        Mon, 27 Jul 2026 08:19:18 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm46610113f8f.10.2026.07.27.08.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 08:19:18 -0700 (PDT)
Message-ID: <02cd566a-bf10-4d78-bb56-420db140dfc7@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 17:19:05 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] thermal: qcom: Add Qualcomm SPMI MBG thermal
 monitor support
To: Sachin Gupta <sachin.gupta@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260722-spmi-mbg-driver-v3-0-ef73064f2789@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260722-spmi-mbg-driver-v3-0-ef73064f2789@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0NCBTYWx0ZWRfX6GdAE4ZHpR9L
 Hd2XYnelqsx1OgOTLQLWH2D8NH3oobiSNUH3m9ieo72OIwVkN/oEEvipquLKWKeAtb9BgptyT71
 Eu0nSpq8MwlVQsA9NMN7dgK7YMwuHv7q6USSRPWOLo3RFbTKkikU47E1o0NC50wP9+Sg5CGi0ee
 pkFUqdUSAMED9ZTRREMRbB/TF/qYIFydBbFcCIPFOWevrOZNwqTRsNBghzLrsnylRDjG40WvXAX
 mxsmE/9Rr9NeXvUHBFU0AlNrf10YTfVYLciKuORakvgvVonsldtU0ac84Ym3if2Fx6nizbowlsM
 Tpu/24BPupCwal9iXv36minJ75ry3nDHwjlHcQx6gUuOxubd/cTChRUp/mQFRaLVE6Fg6Oyy1qT
 HWg4tjn+3Cj0nMT8dnSz7JmSGWOFEGnsyB42/IZ1tlbeBDkMG+7woFtolHKiKlSu1Kt3o9EIguZ
 Os09Xdem6e0/mwdkteA==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a6776f7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=U97uXkcDBxVafT4DzxoA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GG_DTSgvOmqMwhMGqTtvlm7fFvZkLW1o
X-Proofpoint-GUID: GG_DTSgvOmqMwhMGqTtvlm7fFvZkLW1o
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0NCBTYWx0ZWRfX8csN831dica8
 r4kuG0mVKokcLAVIRMD2p6RBkJI1d4ybSygxLFeTeRcl8nOU1APEjaIwDqFMAQKXA0gT5XeKYf9
 TOkdDXU5EgdI0OHu+9r1wDsffVQWQ6c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270144

On 7/22/26 12:44, Sachin Gupta wrote:
> This series adds support for Qualcomm MBG thermal monitoring.
> 
> Adding support for:
> - DT bindings for the MBG thermal monitor peripheral on PM8775
> - A new Qualcomm SPMI MBG thermal monitor driver under `drivers/thermal/qcom/`
>   
> The driver monitors die temperature alarms, handles the MBG interrupt on
> upper-threshold violation, reads the fault status, and reports events to the
> thermal framework.
>   
> RFC patch:
> https://lore.kernel.org/all/qq3cggafexwpdrv46eqijxfmrdbqusl2vpbuswqmcvshqueaiw@r4mrmap4nwkt/
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
> ---
> Changes in v3:
> - Fix Kconfig description and update commit message. [Daniel]
> - Link to v2: https://patch.msgid.link/20260706-spmi-mbg-driver-v2-0-f883ff1d8719@oss.qualcomm.com
> 
> Changes in v2:
> - Fix locking, -ERANGE, enum check, and flag race. [Sashiko AI]
> - Rewrap commit text, rename binding file to match compatible. [Krzysztof]
> - Drop redundant comment, return -ERANGE, fix ISR locking. [Konrad]
> - Link to v1: https://patch.msgid.link/20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com
> 
> ---

Applied, thanks
