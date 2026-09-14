Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3EC3BE623
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 14:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395686; cv=none; b=uqCNSTHUkZVgi6rJLao9yAbeEIbWK+U9t1KHkQximYqRFDe9WuJ05qk1dyteHgOp8D6oo8KZUnb3isZpLlBioYWXQ/LoCL1gmLsfQpOAlsi6aM+Wt1Zw5Ai7rAQlfnKHJYE11fs30E/cnNIa6cPAAO2etaeVKEtOfQBwt4FkXEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395686; c=relaxed/simple;
	bh=qpr20bFoWIAVz6Uu6SDBY1Onol/yGpj70dm5w/7HmbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXi3Gki57Tyy/TWwN4po66K8f6VShyROxR03akVb/gPssxbh24K2jYfvdbJA7t0lMqS5ogGxKgSeVVzbosUQ0GjhdXksgSLTyZEUUwopZ6iOvU/DBMlqUGHh1g3EJQC/ANUqHBdG+e5ZyURKSuojBSUcMYxNCVvS2GN2bOGpJ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAA0sVec; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEgVtt/C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAA0sVec";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XEgVtt/C"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0UHj1761505
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 14:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hsC/n5G/ysH1TDMPqrs15Xr5
	Fe1eAaS5X/4GfDOh5vA=; b=ZAA0sVecotuQbIutF2EPWz8avV8PBXwK/D22V4EB
	T7JIXLLQ1Pw29b6EVFSY0wTE0TlLHg8qvV6Ovch1DnuNa6WKDmsBAgDOqC5PTuHw
	CixdNiZOG/sxPSsQUkr2Jpm8dKWiAr/QMr+AD9bvsFRLx/2dX/P8Syg4vKCUUFV0
	L1N+4XVPHfeVUI6LLy/0yu5JJQapY83jolFHwcayTw30aMwBkLJUNgcQzrjDmiuy
	EtLVZFaInA13UVi4sYGXkQg5Tur2Nc3gNJ1GHg1TMmmKRltzL3ZNdMRdbhd0y4qk
	MjDsMNpT3yqlYInbKgzhkCs/Kot+rkHfPMWXQuX82Ttt7Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex935t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 14:21:22 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-792f917d31aso2773071137.3
        for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 07:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789395681; x=1790000481; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hsC/n5G/ysH1TDMPqrs15Xr5Fe1eAaS5X/4GfDOh5vA=;
        b=XEgVtt/Ceyjmx33ea2Y2eNd2WHvgoX47n7txwQkXNxVn3iXKJ6kqFsVBMc/lUBQB6M
         wn09MU4OkXUSiivFu+YBaNpKmnXQhhfSWWNTiIQ3C/GD40+FYDzZUjVt2PhRDU0pBTKg
         WlWn743pf6hG/H8BLkNVKljzNo6RzMxuio38VOdw/ZmbHQPlqD+h1BlKH9Yn+hLjInHf
         BYiPocD+6JKmBX3gCPtHyMfNYeC4rWLc+VnWqC2bIA78MVoYXjh6ywEkKTxS8jWITd28
         kZCshm7buqfQ3S7eCu16qxKHNlhhx+D1cD8lcvxvsgDNqMbdi3HpHNFt6uAX0PKj6ewq
         T2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395681; x=1790000481;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hsC/n5G/ysH1TDMPqrs15Xr5Fe1eAaS5X/4GfDOh5vA=;
        b=N1CnQPUV9WKt2hIuR3Awoyufr4UsEDl44gChCuIhHVJN63+zeWrSnuXX8QcvBKf4dt
         B4tt2e10E2JFv2rElUodWcpJaL6rCh7B8nS9JLM0mfs9a7Gg0GBT5X++9WLSs8w4N2VU
         3/RbckBB6/8A6bPogi4j74crcSPvWMsRNgGfozxnQuFWd4MmYtLgmI6ZRGgkzM/EyILx
         NeVu9puJwUvaQaEiEBG+KWV99+kyCqi/GzDyPt9V7HBLbHbKcWG2OPM4n4fS3uz9fTR1
         mC0fYxDsvwcsbu+PU8ADz5MGbb44yW0ww7SgC0UVCOa6SC1tebkqtCzaSaKdhTwMBySQ
         3K1A==
X-Forwarded-Encrypted: i=1; AKwUvBwGleJeelaWwbc5Zcq9uL+sHMXj8KJmHsiaPYtivDQTY4rx42WTTkvoLZ5CXHQvuofqzYk=@lists.linux.dev
X-Gm-Message-State: AFuF++mJlHwrz9UFX2m+VM0sISpjL/ffHsvJiOK19YbEsoJUC4EZhSeG
	xVvSGB8vUMAvDPIxO5Q1/y2D2TImNUedNC1awMifI5l1RyL3VtLWySrjC23bmgwsg9bFwFn2M8N
	M/bzZRSBuYsqt9A0WBRqza6w5AC95lRuQY7dFVj/dmwPqcMKplvEKrx8=
X-Gm-Gg: AYBFou15PFUhucYkqECwCDHWk+qy9VyuWIdSJ1PguzT1L7dO2NtUtcaijiOxnbHnVzK
	KG9e7vG/kISMMa38QLL1z44PJ7lUC8Q4/h9NhKzlTkfcHQagsEP0xiRqkXMRQSIbedEJGqnOBTz
	FlqbRFhgStSEh8K1NGV1+bxU/i0+5RUhtfj0umgKGVCtWbhWd2JYlqYNc9QxH9qshiaD75nM4ck
	rY6hTP2CgD/RYJ3sJcPRECq3ljBS+UnxLNI7irJktz4MPQA14m2CFHhWYk6ZsspVCt0n4VtuGpi
	pkkBtTJUG2gR1DREyYACLZIgAzUGMz8HHua5/y8fdUzpk1L9BELqsMoanwpUPBv1q8iOsOjoU08
	Oy2KNE6cYb9nC864=
X-Received: by 2002:a05:6102:548a:b0:79b:dfbd:d0f7 with SMTP id ada2fe7eead31-79bdfbded2bmr1730989137.0.1789395679731;
        Mon, 14 Sep 2026 07:21:19 -0700 (PDT)
X-Received: by 2002:a05:6102:548a:b0:79b:dfbd:d0f7 with SMTP id ada2fe7eead31-79bdfbded2bmr1730677137.0.1789395677612;
        Mon, 14 Sep 2026 07:21:17 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6499d57bsm477423505e9.3.2026.09.14.07.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:21:16 -0700 (PDT)
Date: Mon, 14 Sep 2026 17:21:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Heidelberg <david@ixit.cz>, Dang Huynh <danct12@riseup.net>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH RFC 15/20] soc: qcom: ubwc: Add UBWC config for MSM8952
Message-ID: <z7rjt5237gdtytb35chtyjposyvqpgqfsxhov2all4g2527aix@dabjw24dluwa>
References: <20260912-msm8952-initial-support-v1-0-0e742578b524@mainlining.org>
 <20260912-msm8952-initial-support-v1-15-0e742578b524@mainlining.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912-msm8952-initial-support-v1-15-0e742578b524@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIwNSBTYWx0ZWRfX2fyB8HApoH2P
 r5Dy0klyX0zXoyLn1MuYFQj0GJ+JX0Uy6TzTLr1hJ/ec8Lg/2KyAJSgZPSdWYMMNnTrZ+2l2gY7
 0UrL8j+xD7lNvIeBu0gm/68fJina0fR7TliD6Yo7jBc2xQpeC2ESrIUoG08mo3vOR3tIaVDk36m
 PIpcfoGlx7tBxoXRZUSJ4dGMjORvfEWzD38W7UKvlMaQHPsEXBHH0AtiUOv8Em3e7sg3+2HbehH
 rnqRv2TyVHTDrgZ1uDC98tJXLszDtYIfVfQhTTk43EH8zfPpQac09uO+JsPE+lqM0RIqOD25p3n
 G2kahtW0IQ49wdGSPhD2liV7vlS/aynZ6BmmilRIO4UWIyGpG2XX4uaZMjh0UCKTV4E/dSujksU
 uvqGBZZ96aGE4Oy5aGaQz3Dn9fnkky7ALgRg0YV5isuxSWhE2wStlOlKrVaL6Pp0hMN3bboIKG+
 EjSk0jGrukTPFe1fpeg==
X-Proofpoint-GUID: RgwYb8DKSy07-X64TXI4XG8raS1VtBJT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIwNSBTYWx0ZWRfX5DmM8thzwq4k
 kL7ctPrOAM4XR//sQDm9JHP9Pifo37VMtzaMQUF0EqFW7KFG4KR0xS0GYkQTCWO13aBAxB8FB1r
 tnJx2BP3MtDNpAF9/FV6fT4RpODR8og=
X-Proofpoint-ORIG-GUID: RgwYb8DKSy07-X64TXI4XG8raS1VtBJT
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa802e2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=OvtQcJRYg_U4C0nSOkMA:9 a=CjuIK1q_8ugA:10
 a=TpgoBOgV9RAA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1011 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140205

On 26-09-12 11:39:24, Muzaffer Kadir wrote:
> MSM8952 uses Adreno 405 and predates ubwc just like MSM8939.
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
