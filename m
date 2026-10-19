Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421588;
	b=SbuAKdRP3AU0cMgvAMd7A14NUYUJh8gAd7LtQzYv4ZS9rtxYQ2lZWcx6pBOzb3fpiopM
	 x20KA4cJfpcr0C1i6Hj/x5KRZCY8jjeKBAeLyIVrWOr/68eUFOPwBZpSfxZhCOXEyM1YX
	 hoTo5/n8HnoHoop9khsVtNZNjtWRhI48cwajBNSHI0cuoe4BKqJp73rJfWJtye7L+GhU9
	 eoT+qyys5h83RzT8ANIzP5RYlZwLqi1ErXBD848UmcFiv2IlyhRGnkOT/XCgrUZArhUBH
	 4g7nXRv060j/xEJn2ZUaLignP0n2GC7iaQhAN/1J72YasDkRWnEAIhCAmOtHZlOWDnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421588;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=38Tj1yv1XXuPKoMmKTPWateTUhjdplIVcRpEPbVkhuU=;
	b=fmChAdgUVjcmywutPOBlbJYBO+jWBCAfJ4O47dptbhkNivRiZ6rln2eUV5dSaTifzkgf
	 LtglsQ31oaUNDyJ3fBa2GdUKPtP8dADd/Gk9gntAT7rnrEgZ+DG8nn9UrPvgY/Jz0LxQe
	 l9iHlVybul0+F/QQtCvFjXg6ZuEBozHyMtc7TKCFWDQflzZJ8DCHzYBTxKmPX8etJfQV3
	 vQZE4+P8Um2zJZUhFmGGlOpfD/6cjUMcGomnhIVTqgObC7bbd7+hOwy7Gr2APHkqvrK7D
	 rSOpgzl05HFO6s6VRZTxiLjZy1nqXNUX69HhxnRZqj4uHEFXLKXQ1OqIkHl1Wm7ZnvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=psM6uTXD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="d8w/Ssb1";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA6B606AAD3
	for <mfd.lists.linux.dev@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=psM6uTXD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d8w/Ssb1
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210234C846E
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421588; cv=none; b=n0AhtFqUr0aDfL5Yr4ngCCQZ3z78YJ+dy1x/4KHQdnUiC8B1l/kqg4ilgY1Z1mbnGSWOHSeFGMURKatIX4Ni5vy4D1kkw+0ZYcN6jSBdnisKr+Shqd1KKxBjaJ/ft9bGSaGgD/vSnEwp6vSnguXSsz2jHSAk6FyZsmcYwOH4B0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421588; c=relaxed/simple;
	bh=hQxPdpCxBDIx+pPny6Aea4SoTc4k93a/FzzUSZ3WShE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cv5AL6hYqEoAmdgyxxhlE3Qch/4JDWwiR5GRpUu2u/VN/5WpDM7LTu4o8tgci/csYyOU4el70i2UkqwR6xc75pm7KY3558NHisN99IZupJVLmOW/h/ZAd9DL4KwK7FxnkUm/ewkvzjNXmb2lpCZudeux2ju7AoYgKeFG+upoHCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=psM6uTXD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8w/Ssb1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0KSj3488043
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	38Tj1yv1XXuPKoMmKTPWateTUhjdplIVcRpEPbVkhuU=; b=psM6uTXDiOcUQQSw
	38e20UwanrY0K1ltAHo8MCrCV4Yl/CwRpA7KZpClrR4IsQz7MmZg0hp6BYQLSieo
	sazVRX5eJ/6TR0RJZdUbv+dbhwBRV6VXbSEK3VwbxZqz6CkQdI4J2DK4Uff/4JZU
	GQipnG+/JbP5N01RvuhPceAsl5+3JmjhWACD9HSeTWPPEYFKjT/RHaXUiD+4SQEh
	ciR5uTbP14DltWM/gSHDzG0G2lpWTT0u1x2m9avgQQQaODuvSwg0CmmdD8z6Jw2g
	fQZnEOclohYRFDRVqnkNt5xUSm5xYDPznjEmjZg//9OxuKmy48eoFoL6dtOvPuRX
	W3G/5A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48hq7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:53:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea8a9cfe6so85482685a.2
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 07:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421585; x=1793026385; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38Tj1yv1XXuPKoMmKTPWateTUhjdplIVcRpEPbVkhuU=;
        b=d8w/Ssb1UNpwzSVRU6LLzylO4/uToQCh4s8VYVMbvjua8lm64x1Ucdu2FCDhA7wq5N
         K2eYZEV/nUOnR/8g66cffVUlZgUEJ981xgD+716xwsBAhmX+GvEMUUV79eyVtkAh+rmZ
         R/7ex0zwvo//+bRFr/5ckizfrqSBhocm89CEzp4MAuk7FLJywB/7wDcpxuhuKybapnz4
         rq/kn7CC0pAduAIXdzRX0VvpjppyPoGp6SKQD3/e3bhO63ro0vVTD3V6dz4+pHlr6UqS
         0HUHaWR6bpIqYdoHmhcaj/Bi/SWpS9viZPsp1Ddr1ttuqFGb2YV1ubXK2yIMNSbE/DVC
         KX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421585; x=1793026385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=38Tj1yv1XXuPKoMmKTPWateTUhjdplIVcRpEPbVkhuU=;
        b=HwguJjwwHamoALGB+B34gLT7ZxRvydCFlzQ96b242VArjFlnTJk5Lp5uusrZHnuG51
         R6lpXrO8dPtDEO4/xpyygnGBg8OMTQaENoh6/FdzgZ5xOoBP0J03Rl2fMWMR+qHFdK6N
         H7E4lAU6c8Od/rOz/riV90lj9RA9ABm9Wy6SHlj7IXF4wNGeFLcfYpS9ZYr1XfkSAtPn
         I17OCPBm+Ghg3C8ZJ4MIZJ3KvYO4Fc0Ja57c11AE1hhFM2Gh8lWB7C03AXtjAG9O7jBK
         ogliI+VYXbvll+U366aR8RnWOieI4hKId5mu7hH849zm2800uPRG3Qm/cetSzuvMfr8B
         Y/4w==
X-Forwarded-Encrypted: i=1; AKwUvByOtBJeMwnQKMj0Gv6Vi1GPxJLTPKWa5LFRQgk+5O1ZaMuVbjqOQAbmi1rydRvamFiw1OI=@lists.linux.dev
X-Gm-Message-State: AFq9FYKXLny0I+dcGlFfWInUuwgC5Dap96lnVOSH4qKykOzpgxUqmz+1
	q9Ah0riDLEKWdusalZFp8gfxmMR7UcCjThp6VpZglAyUncCIeIxM8h9LZTE1m+Moi66PSADM8QF
	s4koZsUAY2OEMavch08iP4QkaENQlAwJGqhH2NJd7M8kkzfKZalxCWuM=
X-Gm-Gg: AYBFou2ET7Tgvw6CAR892GSZGqsG2aqz2q2mE8plpp/ZR8A6nRBkRgngotwpXt8hfWZ
	bGvruIhWhABDxnysGCA69c6PJwhG4ce33p64hDaXhxeL19cXc98TdJE5jy/0qK6obELciFrE+I1
	/jkWRmlHlbyvIwyoV07PXp/RK4BcoW3RBYc3zp0y1QiHtKqMKm8sGrOYT3K6zHtZhIyrKW1f9fd
	seV3qq8ZEVahhiLjj9ZXqQdgPYvnNga3Un2PhEHX7VaB6r383zzzhdhbPsVYdMgaSaoXtE/eJr7
	6LyynNeUCyeXOxjgSWzmuzlZJzxIWKsEnNizdUwkHFtHDk/hZiFlYBzBQtRdvWb8L4qmIxFEq5W
	XMe/v2101YznuzHGMmNlqQg==
X-Received: by 2002:a05:620a:4041:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f29d7ea21mr1547531285a.5.1792421585122;
        Mon, 19 Oct 2026 07:53:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f29d7ea21mr1547525285a.5.1792421584507;
        Mon, 19 Oct 2026 07:53:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm380967066b.11.2026.10.19.07.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:03 -0700 (PDT)
Message-ID: <c142bbde-a556-4ffa-b005-d12779fbcef2@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:01 +0200
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
Subject: Re: [PATCH v4 07/12] arm64: dts: qcom: pm8350c: Enable BCL sensor
 node
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
 <20261005-qcom-bcl-hwmon-v4-7-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-7-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX8C3tn2kGkghK
 Vdz9c5DBX8RV4GWvXMOhf3nj/gjW74w7XyA+eNNemX8AkKZdkiJtPQckI8oUWx3AsMK46M+DX79
 K2rgTEQxQxINhgO6bONoHGIc/5O8vXxZxp+gfPWdGURw2Rh0W8WP6Ubge7iDhjky/PwyX3/2DuE
 e8tDTcvz7sng/zxNV1C8wF+sytA0BhFXzpK4UXLG89sE3Z9odk8YAa0JzyVHWpBjd9ct/wC3Y1Q
 8I4VsEawm46fLQwGA0/PSnjrx1gD3AODk1iQTTX7jIQYjwOxIczN0SSeb5m4lfZk1cpvCrqI5r+
 eRY+fP9BXCuam0GtiSl9ba/KtwodOk6harjpre2fLkpmkUiptUvtJMWQcG0rEd8g+A8EPlECy1b
 ZLQlfXcPoliXq7yz/2PDKJbYUO4HUQblp2/cPdCV4zgOVXOh8N8XobML/Uu8Y6z6B8kjRmKK2Le
 6wGhSy4UkKj96ss/LhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX1OUMXSSweufe
 /EE1fD9SRt3iROOgWe/pEmEkpdjK6pqoOY7mr7ESZ8Pa8xcIOMayc/0YvpFIxEyf7lojTNldlGt
 kLVPnIcmkLa+5CmLCflfTaucvpnPsCM=
X-Proofpoint-ORIG-GUID: kglziQzFnlZPMtrT4D9RwdNrYoRij-dL
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad62ed1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JQL8vk9cGjK8yxBYMiEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: kglziQzFnlZPMtrT4D9RwdNrYoRij-dL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
