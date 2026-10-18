Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016663148D8
	for <mfd@lists.linux.dev>; Sun, 18 Oct 2026 23:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792367139; cv=none; b=GzqUULvRAlsaDgfYWXu4E5NsaiwfjMs0EarSNWMGVvSONopYKmiPPRsV6QINdYF+/9SIEA5THeyAPtoBDxnJbAzP7s9LiWoTpEwlv8CGkfKvJZlGby05+Tl82iw2aLTd+60evKZvvUv159NCwJToH4eP/3A1X3ULz/F36sIFXX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792367139; c=relaxed/simple;
	bh=1AvYdMYtd/1ZKZbYLP62bFavrHWwuuMlQPw11R6NvWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSF+zuG/pCoN4ca/OgE5xIpv68Iw+GARzKczUhtEsS0wPpyWKl9HlRVEw6jXN1hftNNg+RZoRLJ+2wLTBxtfLnYMSjjZOYHM0q4mmTbiiT1KWwdwAYxC51U8Qsky0CBhksXrJG5WNFfj8wRMvqaZ7sHJ0BJn5X33yHz4pFzmRs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RKdAVw1I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+1BwcI1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RKdAVw1I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+1BwcI1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ILkAIr1958021
	for <mfd@lists.linux.dev>; Sun, 18 Oct 2026 23:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODWpiVcrxaQUpUrVswJKsFz7HW401KcA0InWn1FGZl0=; b=RKdAVw1Iw9gQ6IS6
	yRuujisja+F734Qi4hF4ZMpka99CH+9RWkZ9DI44WM4nW3kmTZSYsrFvtxjTSOeW
	aFX/WWo/3qpR6NTI/IWBxO0MQn5Mf8qU1+gxOYFLIzFAIPu+T3vjmQFSJf4E8tcE
	5XS+9Qb5amkXYOrJ+PXWgaqvwpQyHKyCAl4u+SazY+zd/B0IuXsHDQchJQnrp2/W
	4icKBA3xcAm1kDXXXl2RpeWkuv66HFQhhEuySvHjii7bfnT9QGCHu6OFZMj5SpaR
	2TSwL9xCknfbc+1Q99EG+32Y5z5Lh/dyMBK3KD0Kb6H5ef8fSeZxD0H3yo3KElc0
	HIvDvQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxqfvdry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Sun, 18 Oct 2026 23:45:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so329523585a.1
        for <mfd@lists.linux.dev>; Sun, 18 Oct 2026 16:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792367136; x=1792971936; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ODWpiVcrxaQUpUrVswJKsFz7HW401KcA0InWn1FGZl0=;
        b=f+1BwcI1BMMnoW32CwQg3quKe7i3LHYIoPw7hquKwDQSa/6EXCB9PtT0suGZf9jYub
         R5tar8KucvU+3+nDThoFtS/FXbaXQgdTcHm7IMEpvqPpZwAATkk9FpWJ50NeDJK2Xw8R
         SYZ5pInY5iBwiNS0I5yz0MSNTWF6RiGEXZEiku9jtN1JX3hbYy3edVMYb4bYtfxh4aLh
         VvSQWCU7RAsb1L6xG3ai0lICTBy9s44f9qjjm8AolgCWY3Lq+jEV4NdDxFcG8ueCWKSw
         wMQJ5+QK1jVlQVWH7oEG12b+eUIBRztjxbp0HcRbtptJCDDKQqh6Et8IeS2hv1YZGtcJ
         N+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792367136; x=1792971936;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ODWpiVcrxaQUpUrVswJKsFz7HW401KcA0InWn1FGZl0=;
        b=KW98VOBudPTjoMV+tQoLwbUvXzB4j0sx1TfYPj+rhz0licqJer7Ui9O41Lhis9Jyuq
         ss65oz7Gqqrs4JWtfkyxPYTlUnZQZuNknp1V/0SW+I0n2JsfvymPChCn6kPeA2tECMUW
         sBdn22LkBGZKyU1oJtoXyyjK9xEPrAU28BsJ8e1NX3guZYCTal2JhzH8UPHvmmIwZVkv
         owXl5K2FIfEr63UJFJJckWfjDvK+ojX0aFGyfMNjAyp7Pt1KyDWltK1J5zpHrCmdU4Xc
         6zQQmXrGIPpxcsH1gU61cvQ1MYrmjLGceKwLibIgfpA2moNwkHb6uWbaSGZuPiJ0dm8A
         xgzg==
X-Forwarded-Encrypted: i=1; AKwUvBxjK759B22w8OxH3NasOcNDJwbxafMFjXSA3j+vGXFXh1TsgeWWfAaLZRuSkRppIStc+VY=@lists.linux.dev
X-Gm-Message-State: AFq9FYITMdPQd+cvMIAiiFndrPOvVQj8FmhLgAQgDSJogZ74GiPAS6ap
	sctoKKrcE/s6mf0YpnMZcJpQ80srtWazDSIjVOJgNuXLBj/2+cbcg0PCQUPvG1dWc4QQK4tBzVx
	O8HPRi3/C3hbaj3lh3LJjwZqqmADPFoNpHPMHADk/oTxl7mhg62DB10g=
X-Gm-Gg: AYBFou0mrDo/0P9/4Ye/+RsbQoNssBtagKFTNi9mUTZukWr9RuBoIBAQVRJ0EE0MFV3
	lm73qi18VMzGyn0nZ+7BMiMTlw19efpUbxLR4bxRB3pLQwDm69svBOiJGisvWS6WxnQJ2lEUkGh
	OI7eCpKxdtZdoHr1Zi05OAz37e/xxQ+PsM3e/lPTDAMmkJxWGhnxgIH+0iUrNuf3x2d6nAHgCad
	aAWV3j2srOzjt4Lyeuz+qU73XUBY7EOqRNXVGQqlMRa0CYYcyl9xFntsr2XrfE2FUslWBDH2fhf
	Np7MP8fC4x5IPX5+d/WJ1siigF4f8bQBpBPzt9DnTUmvtB3Ei8nFIEKbLiW9tmK77p8xi6xVt/y
	WH46dW/kJCEGZnESoLwVDg6MP6Ilf49ly0e26e1QThZ8SJQcQcD8eHtiEuV7FbJsIPrQLP5plYw
	FvoYkEx3ryvsLk
X-Received: by 2002:a05:620a:25d4:b0:93f:12d4:67cb with SMTP id af79cd13be357-93f29e0edf8mr1014971785a.80.1792367135962;
        Sun, 18 Oct 2026 16:45:35 -0700 (PDT)
X-Received: by 2002:a05:620a:25d4:b0:93f:12d4:67cb with SMTP id af79cd13be357-93f29e0edf8mr1014969985a.80.1792367135493;
        Sun, 18 Oct 2026 16:45:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab3c2ed29csm6188191fa.11.2026.10.18.16.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 16:45:33 -0700 (PDT)
Date: Mon, 19 Oct 2026 02:45:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH RFC 06/12] usb: typec: qcom: Add gen1 Type-C port support
Message-ID: <lbi4udyoro3757veeshhm2ou7ocx4ykwr444ljdpx6na7vjrlv@ud7z6vk7ggmm>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-6-31adc19f32c6@ixit.cz>
 <4f089c98-a479-45c9-9b11-0207c895367a@linaro.org>
 <391498ea-51f1-4390-b84a-d0d738ec409d@ixit.cz>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <391498ea-51f1-4390-b84a-d0d738ec409d@ixit.cz>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA5NCBTYWx0ZWRfX4Ks6wZjLJatQ
 KjrpPIomZhk2lG6UocWjYbs0Dnt5ugtpByvSccNuU4gCC0VzeAKG0nemNSEarc1hvSSlfxncyGg
 aLuMv/cD54MPtyht18kx3Ffzb8jyuds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA5NCBTYWx0ZWRfX5o8CIlP1wfGY
 JMUfFH4qQAzTZx78pEeqZLwYMeG47moBEfao4uO//qfRWEcbLDzMfBVqqdesAwLo7P4gZt594Vg
 j0Qp43jw42gZfD+Mdrd6dL9JCjy4mNYcS1ImNLltBLwTfTazADxDB7E1MMVbAs+bbL81s/4hNsY
 awhCb00DIomfcHQGSwhb0lJXL/PFCRP/J4vJSUD9OlZyhZvlhJEeCsiAwlBIlYvgQDFDNMmi+D5
 QW8F7VMR6r3imq/7JSY4ljapZBMhYZtu/JdLPCEJ1hs3JT5dWHAaiW4Ze2AVYL0vmlC0P4aGjxL
 VDjJvCA44mDUcE9icW6JlfTmVbcg8PyC686r+bl9xLqwIf4ky7Jhjsr3ENwnjLlhb2IOOtbFkYb
 Cjc7GK6YxA064uyE1AIs0DHsOmgHx5xPNJPYxgcwlmAbji5Z6/WVfEcaNfBr7fMITjwOGSQ7WGn
 /jnObusiJVFuqRwYbEQ==
X-Proofpoint-ORIG-GUID: HTTSRzOjmOPJkqJuT9LEIqb9dMl8stBZ
X-Proofpoint-GUID: HTTSRzOjmOPJkqJuT9LEIqb9dMl8stBZ
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ad55a21 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=6bO6gSLE2J104ocR4bEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610180094

On Mon, Oct 19, 2026 at 01:29:53AM +0200, David Heidelberg wrote:
> On 26/09/2026 16:22, Bryan O'Donoghue wrote:
> > On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
> > > From: David Heidelberg <david@ixit.cz>
> > > 
> > > Add a port backend for the first generation of the Qualcomm PMIC Type-C
> > > block, found on PM660 and PMI8998.
> > > 
> > > On gen1 the Type-C CC logic is part of the charger's USBIN peripheral
> > > (base 0x1300) instead of the standalone Type-C peripheral used by
> > > PM8150B and later PMICs. All Type-C events (CC state change,
> > > tCCDebounce done, VBUS change and error) are signalled through a single
> > > aggregate "type-c-change" interrupt, the handler re-reads TYPEC_STATUS_4
> > > to find out what changed. The PD PHY is register compatible with PM8150B
> > > and is reused as is.
> > > 
> > > Differences to the PM8150B backend:
> > >   - get_cc() returns -EBUSY until the hardware reports tCCDebounce done,
> > >     instead of using a software debounce.
> > >   - As a source, only the default and 1.5A Rp can be advertised, 3.0A
> > >     requests are advertised as 1.5A.
> > >   - The PBS workaround of the downstream SMB2 driver (TM_IO_DTEST4_SEL)
> > >     is applied on every power role change.
> > > 
> > > VBUS sourcing is optional and only used when the connector provides
> > > a vbus-supply, as the charger doesn't expose a VBUS regulator yet.


> > >   static const struct of_device_id qcom_pmic_typec_table[] = {
> > > +    { .compatible = "qcom,pm660-typec", .data = &gen1_typec_res },
> > >       { .compatible = "qcom,pm8150b-typec", .data = &pm8150b_typec_res },
> > >       { .compatible = "qcom,pmi632-typec", .data = &pmi632_typec_res },
> > > +    { .compatible = "qcom,pmi8998-typec", .data = &gen1_typec_res },
> > 
> > I think this should be
> > 
> >  > +    { .compatible = "qcom,pm660-typec", .data = &pm660_typec_res },
> >  >       { .compatible = "qcom,pm8150b-typec", .data = &pm8150b_typec_res },
> >  >       { .compatible = "qcom,pmi632-typec", .data = &pmi632_typec_res },
> >  > +    { .compatible = "qcom,pmi8998-typec", .data = &pmi8998_typec_res },
> > 
> > Since I'm not sure "gen1" is a real thing and besides, I see this
> > gen1/gen2/gen3 stuff in CAMSS and it means almost nothing. The silicon
> > version is the salient thing.
> 
> Best I can do is GenZ.
> But now seriously, I hoped someone from Qualcomm will chime in and tells me
> how is this type-c block generation properly called.

Just use PMIC name, please. It's the easiest and the simplest option.

-- 
With best wishes
Dmitry
