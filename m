Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421620;
	b=cHrqSe8LV9qVd63DkJc3S6bYFWnOJC8OTW36VFiN4Ngnz1wYCgMYRITylRagTetZr+yS
	 5CI0i705roiLHiQSc92rd5yx0+M1esWQO3Un6EB2MWIyArL++ldhmlS44FMxh47ocaFik
	 ECUedIa5NUZOaW+TCXhJTPi/xd7YecGuBIetK5EH/JAnXhtFsi/RnHTYyzotajoGnSPV4
	 jqmTNZiBGla08m7MZa/rhuFPkRExy3LuCVlhZ8R/SJroShfK5uFZ5dmShsqFPB+iLlsUo
	 1lbwRABc8gllGoeZJ9xKNGlt0WdA2oqT0t2tc5UCm/03NDi70bGM818ZrvKqjR7XZyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421620;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
	b=gAq+53DMqlonBoMBhJe1Euf/OimHSK2pUPfjtndjcktPfJzbCmB/WtTrQAvYUf4WHyUi
	 bzrWHP73faAt2QgofcVxv9Zm/oLQjoSVIwwgxTvSnE3UMJS5VRetFx2F4Tjv6e37dJKQ8
	 ylY+L+96NfmDy79jz4oMTpRHBdWimvjg6vHDbASbhs6GjxozlR//xng+l5ZHxch1PNzum
	 F/VyFks4VmrZLgqYWIhBdG58YY2cR/l49ujHdndPi9CF6nYUydvXOSGI8DfG2SqdaC78S
	 4PBhrbRBxyJ2oz8GnBuJs8aYvvb4//y7e3JgG6i6Ynqz8VDG0KXcxzgJD2Qlv7cksKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nSi9cEKv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hjNuJEHo;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A47C606C158
	for <mfd.lists.linux.dev@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nSi9cEKv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hjNuJEHo
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD5B484247
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421620; cv=none; b=FsxjgED+EEjSnpPpO7LPBJjvSasfjUL3rbkw6ui0ljIdy9GaRefpuTewLL8+MFNyiMXDcNWW1vz+QrVTL4bIa+q0kCMkERWIC8cDHlXItLyM/ZQUWmHH14Apbgi9ksNrHFuHvPH99cx+Wc4vil7gDdOCLQbZLdR/EPP3vF3GZMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421620; c=relaxed/simple;
	bh=8QzhEza4cmQmxyVPqaeJPOjfbUX18+JD1Hl1uHqCQBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kgYTn9gWAcr1p73HgyVoJYXd8lQOW/3yXGPq4hVubcqSgEVEFw+kbcOTayFJCyd3t/QrUrYkZoIzl2Vhb/lspBrJ4qcsd+ojPnN8C8lj9uWYyNkpX6HFQRDFDQZwP8WPzcS0P5rLE1tDEoggifzgIfdPsCky5aOX4G3AjFSVwlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSi9cEKv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjNuJEHo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0gfh1904066
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=; b=nSi9cEKvrnTAy8UA
	8L4nm0gcCkj7I635NL+UWzlhSkbS824yj50HkV1/ze7J4ovs/mSSkd8mexPnwtuy
	SpmxhvjIX+FOVfxcxdhOyfRgXJvy2V9WvgfNLnNiOUnDXqPiBXg1o0wZh1N19ydI
	cnwXAC68b0LzqGsC9ts81tKYdGOnt+DgHKSeROaBEMMFyA7s4llFFTLdh5KBw/XE
	M4r44Dd77on0iWUgk5O8sWBekt6aFIDYpK/JmPC8+E7nhOIFeTMQLRCQ8C+PInd4
	JfdPdltqtlDKuWv01JIh9FWFDE7fBswnRIVU94elAaoS/0mDzgOnPqH3EOInH89y
	R2W1xg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c9qjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:53:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac58b24so76554785a.0
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 07:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421617; x=1793026417; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
        b=hjNuJEHo6KeDFOoniJuLb+ubV/XP4jAti0IdKAUW+na65WSjFG1mVKOrvaOryq0PHO
         ZhmFAS+hW6GlnAnerKahtMKvWh6s+HDLY7SV94V7AdcuSK0YGDKxBv1/Eg5tqkixBheW
         7f1nTJgMC8PaczQ431LPkZZhB/QVyScIvRrYACvGCXKLJqlbeRknA8cCIwjMj1yCLtE/
         ed/jobmdKmhe8vT2rGnRfacC28tsOrq5YVSIVAGeH7XKKOfz3/wDZDeRfZ1tB8pApsBQ
         bdH+WAaXtbinM2+FAJnDx5Qg4LaF4O6rsNDMFoMKGM/pdgWr9XZNvZUKdsG7anp8IFz+
         FySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421617; x=1793026417;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
        b=ecvFxwbiK/qdsL9Q5EuED6TQ8C9tJF3f1uzqENd6UI9z09sO1t7lXcqScYmzUNUmK6
         pzLIq9XQn/yTOKt61lFsqObCe6unP9ch+JGLQdW6k3u/B4qhmf60VE96qXaa39lz02OZ
         LUIwXGdsTFVdkhy8Sxjvt/glUGQSPuT3uFEwm8n36QEQSrgq3jwVn6SxG5hBnWkg/7MJ
         DFGMpFeNqaNngQAZcvX6/meJHd6gwumApX5Ci1uddLsMXjUFUx70p5ZKSh6y+83+rSPo
         0cDckd1V2AppGx6RPrp1d1f8MnlSnCWFcBGeZbG4m9ROa8Nly2zq+4rcRLdDntoSs5Oy
         ehQg==
X-Forwarded-Encrypted: i=1; AKwUvBxHNpE0BOqBdmfHm5685SWMX13fW7gRskR0a5czg84ENqW2T79Yy6SOoxXxFX2rEiWQE48=@lists.linux.dev
X-Gm-Message-State: AFq9FYIqkONfCOgDGmn9tcFjm0CgKqlH6clEHyia7ND9xk57OyyNrcFP
	/GC0u+zj9MuAu+USczfbvadup1eZe8PcMqpa4F7KfXcTfSzFdJ9HmrwoMmvX0I0zJcF93uAgXGe
	fep+bkYKm2Ql0rT610N46kUZeA599UfSlfeCcuzd6VJDNN5K4V5dm1c4=
X-Gm-Gg: AYBFou3SyfZZKthCgROdmg4QZ87ZRl/Tq9BbBnQdmyWLCKjQFuWSt3zq5a1INyKeelw
	HkL6prFLDesZPIug8h3jWJu4+qoRckr+tUnjqGGHCfWF9/+LsaDanOddkO1I9bBzUP7Ccfme942
	Wp8iwJEnVl7MOSxRlP/dKHzYK3yvRhUurYTqfP9E36irqbC+7ZsklepluAYw8qkStzbHNbMurji
	0vLO6HWhGWUN5nCqFlM7apMP/bGPyH67Jeb1jwfAqYh2y9c1jQWCY6bnHwl33IxkeQdBVmBqaJ7
	GSn5MdO2DH5EtkDd995Mm0W9rY5HNkmUli+oLJOESNRI2DK8YGJTTBIDHsekA/3eXefo/2B+cDV
	WTUUaQKGcCCpeY4E8GeHkqw==
X-Received: by 2002:a05:620a:4041:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f29d7ea21mr1547815185a.5.1792421616948;
        Mon, 19 Oct 2026 07:53:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f29d7ea21mr1547809985a.5.1792421616351;
        Mon, 19 Oct 2026 07:53:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb2f64sm365653366b.77.2026.10.19.07.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:35 -0700 (PDT)
Message-ID: <af21a2c1-f101-45af-8895-daad2ec3a9fd@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:32 +0200
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
Subject: Re: [PATCH v4 11/12] arm64: dts: qcom: pmih0108: Enable BCL sensor
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
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-11-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-11-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXz0Dyjq8T5WPy
 RjldbN157vmfFcN+RpKnyJ62Um7/g3fwOdFOW4L5rqfKStGunuDthLfbmzVsUsCjdQuJS19iqXY
 j3APCp6vL+jB0eNtYXDk14WIegu64uw=
X-Proofpoint-ORIG-GUID: 7pzJWUfZrKNK0TxwV__yOghtJtwoDshS
X-Proofpoint-GUID: 7pzJWUfZrKNK0TxwV__yOghtJtwoDshS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX8gtm5o2RQKX0
 QP+Q+RwqVkScrXKLa6SRBlsX4/y2gguJErwNjg85WXCVUE9cNfZ+p4FWt5o6yJAaw8NDSoC6N7C
 wV0gEik0PyFYm+dQSivDwRN92E5bUXH2X7MWEO4b6QjJ4qiQqoyXZtLIuQFDmML6P7b0u07/FPo
 ERrCG+Zagpa2AwZlTY2C53/BBrKuRZ468rgeY8tTazHIpPwQ4JOSOw+GExwLkuZ9Aqxyuss++tC
 39aXd1otGNh0VN0R/Ipvm9jfUOwGabQWEc9GgJ8y9ppIDaa2H/+Bta7SmYB+RwCn+M8T/pB9DBy
 C0fz/kT0izEMrCBZecCXsk9yAzEU0LVZGv0Hwlqe2UuXi3e0YvMkoZsDL5uIVxSS+1jqPfH0206
 TrrJg5u6Tti7/2vRUMl35vDX2XW8FCuLZdvFZSPM3P+5aw7rjN4YWz5B/fGWmq8ZY5yU8Bh4ZbB
 bxPBtuXSY2rLymmJCwQ==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad62ef1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_ybYkvnUm3iZRZ9voNMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
