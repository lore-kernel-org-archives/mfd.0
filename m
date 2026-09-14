Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F6843F8B5
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 11:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384691; cv=none; b=Xo+arow9CrcRxLQ1P8cr7wshsa8rnVxiPAy9vwCmniecR33sVsPF2M/Lt8v2F1xJcG9Zb1AwlTWNmqaV4vOVu6HzpbLtfpTTec2LvLhCvvhmApDN+BNpTp8Z3jos3OuIodwHTf88TmsREKTQHB9w4yHN+8FxRBP2nJFyMUmFbPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384691; c=relaxed/simple;
	bh=qyo572r093/Wuuigpug703R2+cl/gSCazJtTr3U4JHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qviXag+LHs5oj7tYkwyPi1Iwc1r5zZ22eWiRQywIyjDAvu7RUu5t/ZrTAw+mY9RO81A5/Thp+z4z5gjrlU7/He7pm1Pv1VwXW8D1/8OY8RYcUP563QUW4sXpyo9RUURiIXgL0Rlw+Og5pPzKa8k/nyY0LKRXSPPJqE2h86GCBJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p74lKPfG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cb+69/gj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p74lKPfG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cb+69/gj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmMGA4032528
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 11:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lu8CNw9bVINJIb/MTRXcrF6ffg/r+0oykIW5TY8O4Y4=; b=p74lKPfGoxBk3sgk
	Nv7jbyh+PyzNnEZXmPSeygceSiRc+hzxKGqPe8gSasJEoh9jI28KkTBcCvBuJBBC
	WzTOXA5JvbzXDVBVkTe8WhQNutMRPF9it0XS3DkwhDoWGJi87AXJ0+RlvEDct+CO
	FpWCASMm55uop92Bmk6T/9dn+zzxgMzrOQIb0RYNCmSme9cM+opFd9GTGy6LqdXv
	WLobHlPt1oeF94En8pYt/HsObrlB/40wMNOpvIJbiUxfXCT87bg3586GtWX2lorZ
	K+KSP/tphg2ZnwVCfvi3/hoL58VYSv1yosERpux0u3wiqzMpl+SntE0EUvlmh42G
	6L58/g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq89tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 11:18:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9349ba88188so52701585a.2
        for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 04:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789384688; x=1789989488; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lu8CNw9bVINJIb/MTRXcrF6ffg/r+0oykIW5TY8O4Y4=;
        b=cb+69/gjUNcgVK+HvVoH17Xp9L+4e3Hy6chPQFJ5qnXZJ0w5zbM2CRsCZ2j8uJ4DPB
         hjvU2pDBy3o81HkhXOMrWz67K6+evd6GPW8HRvT6/NlefL27wbCmV97QXMmb7EderNLg
         IsfX41/nQFho5fe/jQORJNX9w3Xttj/d29Q/HqrSn8DAe7H8CStJM9JsM4qPrKkERP82
         RzCkRbihvffAF4dNguTsa7XCY+CHsj6KhzHzzIMwBsEGdspiLPlhrop5YUlZbrvQ34x9
         8jLK/yioK+KYk/8UaBY94gaGKtjy1Ws3v+T5j2o4k36sMRYibNPYBeYldUlijw+DpNO3
         wx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384688; x=1789989488;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lu8CNw9bVINJIb/MTRXcrF6ffg/r+0oykIW5TY8O4Y4=;
        b=KsZxV5A0VTT+mZ9oXk3u0eEtKJ3hCxVxQfnRidj37p2Bjx3itK9cEtjmu4hzyPB5bj
         GfRfN3YR9ZaxUH5BZwo6ZHppi55Czuvvqc0fLyRE5t2vBNi2AJlNsG16nQypCiaJldve
         LlFX5iL0KvthSSIB3qq8L04nqkEoleYh3aOeeMqE0j4V3VuVH++cjz3NHwSQwQlfgNL8
         ATqBwDTGppwvKiSWxiKyHSf2PAKGoRja1MINNyU/rYNT9JsejN6um/PFR+eTCct6x90G
         +/G6YK4lyiBDI5NpAICSgqKeN5Ek0aESwJgtsqspohI7poeW1T65hinTNCdYEr/dQKqR
         z0Bw==
X-Forwarded-Encrypted: i=1; AKwUvByzctxoF5ex97b1yQGdKqDEpS7NmrPS7jzbOTQhmG4GEgkxz7zCL53+p6RotQwow3fu6uQ=@lists.linux.dev
X-Gm-Message-State: AFuF++nwXCPzU7iRenWkmFxpyvZ0jP8P1To2PwmXPIQlDBKwkzrS4RVI
	tbtzQn18hNbnJ16H56aAzyTNhCQeKaK1db2/DBZpHp5t1lKPuAVVUyPw//dJjIFmkDQnOq/mbtY
	CrKTyCZiY3rc5MZ17tk8ZUtF0wIcNQQ23w0o5dFwNFltcR2SMpAdC+Uk=
X-Gm-Gg: AYBFou3/OgmNElwk6GrgNSp4UNFW5pJBh+uzxQr6gCEPVd4O/glSAX9fYbzyqEiP0Mj
	iu52Muf1o/LVxGScL3IXx4qSNPSxTgtrIE+Zpl+vCkmARO4rvLWdFBxAExGX38bxo+ZuvYpQ+7f
	MIFFoBQhEEjZjru+hzyKB5vskwk4ylQ6kd37FvYgnVB8K/kwu9cK/Zfohl67ljscAagSNugK3ls
	4azAkyZJm3XsplmJogeFgUTGbYdmrNViRpkPw1zDzZwUXIokgTlydbRbkdBvtcRZYrS9C3ynZp+
	Gsx9g2aoTVZS2s9cVJcEcmRBsaODXlbqo69eK608G+phawCk0JIojr5iyLoZzl07Gw1G3/XRDR4
	+Oa4daAXmNkUqKv56z1w4pA==
X-Received: by 2002:a05:620a:170b:b0:939:8148:1e3d with SMTP id af79cd13be357-93a2987c21fmr216469485a.2.1789384688283;
        Mon, 14 Sep 2026 04:18:08 -0700 (PDT)
X-Received: by 2002:a05:620a:170b:b0:939:8148:1e3d with SMTP id af79cd13be357-93a2987c21fmr216464885a.2.1789384687844;
        Mon, 14 Sep 2026 04:18:07 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b593d7dbsm4143990a12.22.2026.09.14.04.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:18:07 -0700 (PDT)
Message-ID: <21722931-0a6c-444a-b23c-59b47dd82430@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:18:01 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 13/20] clk: qcom: smd-rpm: Add clocks for MSM8952
To: muzafferkadir@mainlining.org, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
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
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, Dang Huynh <danct12@riseup.net>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20260912-msm8952-initial-support-v1-0-0e742578b524@mainlining.org>
 <20260912-msm8952-initial-support-v1-13-0e742578b524@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912-msm8952-initial-support-v1-13-0e742578b524@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2MCBTYWx0ZWRfX+fkJvXTCvSZM
 eMusKlRL4c30WYUS7LLMQb9RK+5caWzgJEyEvAXzh0cNLemIivzzXIo9lVoSbCFtELLij6gjrTm
 DMDFfbe809VyuQo99wBEsdK3fQX5EVySDuk887Tg6uU1RIuZVPxcC3xemPzNcg7A7HaYdkeyyu7
 nICOpvDcEkcaT/oBmBg0CvoNLLh2SGz91yHbXwTr3ovMIEq2b0t1huQNjHJMkotEhdRVZHcGO4b
 OBA4aV72f7m//i4KjOrhJ1J/3XU1skK36VprI+PgD6k0HAXp4wmFeOaaUuXk/lnXoqdeLaU95yy
 UhN77xEc6+jSaJJ7E43C17L68Sa6tUC6khglhvv6vIWx1kbDlQTZlHF3uBtEssUbl+zFvukMSmy
 +GcuF4EAp3jqpdB9yB24uaSA1ggd8Rw9O3W6/4xQNTFueHS+OWuLnemqDM+CXUZpNFVR7dVs9XX
 UqY0PuAofDRO1Hz8T4g==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7d7f1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=OuZLqq7tAAAA:8 a=lCfP1g0v9f8vL_Xsk8YA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: amqgGPlKSTex3gm3cRagiWzOry_bU1hm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2MCBTYWx0ZWRfXz9XzKB6IuG2U
 D8nQmnLOIYNpxLoFvtJqlnY7rD1YHxAWbJPUpoyMHzt6krL2K2Rn/tAD4x+1E/vz1EJu4GVg5qF
 hqYd0x5fbAO3iNzKnFinCCp6xgbET2s=
X-Proofpoint-GUID: amqgGPlKSTex3gm3cRagiWzOry_bU1hm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140160

On 9/12/26 10:39 AM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> MSM8952 has same clocks with MSM8976 and MSM8940.

Let's reuse the compatible then - add an entry to dt-bindings
where we have a 8952-specific compatible in case we ever need to
act on it specifically and a fallback to 8976, so that we don't need
to modify the driver needlessly.

Your DT then would look like:

compatible = "qcom,rpmcc-msm8952",
	     "qcom,rpmcc-msm8976";

Konrad
