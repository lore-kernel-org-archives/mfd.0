Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BC54E2F18
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410387; cv=none; b=d0tmJfubpACoyf20K+10oWTytI3H979sTMXJMIe7YiihnBrZi7vDmf9JHAjnbLEge221slPFcaOgHafvIgHRxPSigDyA6LDzIgk1O5Mq+uuy0d1p2z0D0+0OdQ1QgsgyTT/rATLfF/7MGIB1HYmx+KfciQo9VmecGywP/cu7FYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410387; c=relaxed/simple;
	bh=ewQoxyQLo/SIXE0r9ug8m4TnQqvVKS+4FgnH3/X1IRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eq4NtBMSjVlQIX2gSPdm3m/CUavBLtTb3MQMRH4JKQu1t7zlPooaJx+coCIO/Wtsggw0PgzXtVchSL7VfoOhj19N2QeU4thFwwMyUr0LfeOpeNzbRgS0kTR825U2crQh+AnRp71K6AUN8JEUHbI42epbD9PmJPMi+iqVVjfxjKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TEaqUc/A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRgMDux/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TEaqUc/A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRgMDux/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OrFi3305537
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hG197sZx3XRJAemskE7V+hMh
	trqkgeOsYb24Xht8LNk=; b=TEaqUc/AW2zv0dvvnpDGjbJ34/KQDGa49xWXOlC6
	yz/a6Xp6aX5v3p3UgpV+s4NNziLQicA+imw6XHDL5sTpGfxlnvUIPDyXYxy7GADV
	G7JscBXn6Mg6NOG3jb/vIszrSa4jEGMWEgItHiJU/ZlgycX/KT6j7cPKNqLwFO6I
	mrMjWB4dAWZoYrpSRN7NSgZ7Kc6IL9SC3Gr6nyRCe2Xv9AQfof4YdWucsVpurvpi
	/QvDTfMq5abkWg1dR4XwYEkJf8D5/jjMoMkvbeQ4qHhUXD5Fxy+kev39xWw6OTPP
	8MAqZgjbQ1GcywD+xKQjFwCyK222Xlnw7uAsbnQgqF2TkQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf47gvts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:46:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so383003385a.1
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 04:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792410383; x=1793015183; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hG197sZx3XRJAemskE7V+hMhtrqkgeOsYb24Xht8LNk=;
        b=fRgMDux/ku1lxx3aC/Tv8j8ZDl4aeQ0TtyrOg/HKxIqXj3pTlwjFcWl2uzIPFSMQRv
         Nv88XKqMYo4aYkinjWdsCTEmEo1ShmqMxpFI/sRDyjNd4J2ViIK8d5oj+/Rjw15IFpuv
         YsU8j2zKi93QZfUDrwj+jycc87R2tNIVGS556stDbLm00tzziIl4WWENWQJRwAo6UnDA
         4RTVA8hinbuE6G16UF859E+4GMuq+0uTcHq/0wRF3+3OOrLU6ppoRascoYVb159JEcDU
         g7ae87uOY4SIJRKxFKsAGPhU0yjEsU63zTIcbkqSKV9zpIUQeixdEtMvWdnexS0da4iK
         pfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410383; x=1793015183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hG197sZx3XRJAemskE7V+hMhtrqkgeOsYb24Xht8LNk=;
        b=uBBb4w2VRetPi79ZHGFaML/GG3RNQwkwm1Z2R4dPRwxF2CXyF85jJFn+ZlexxDVRe9
         44WEyz9Jpx8HF7E6cULU+Uycr4/HX+rU2XydtRf+jkJsLC71Qrvw+CADglDveW6ISUiX
         tz6ZRpjh08nolhtG1K9O2K8moBT6TbB3L0YYL7dDTkLdfqK51S3FjbQbUBI5XQBundkg
         xamCNdBEzoNjHFdS/77F/8oQquauBDzbo94E9C7BNQqlSt0efytqF5tnJIW3AAV6OZ4U
         uIbN6ahNhtKI4BSAjBbPsgEvOq9pvAwTXlcrqprFQxtjeGw1ejCUkKcew1jRcvx352Sa
         K/CA==
X-Forwarded-Encrypted: i=1; AKwUvBz3qB5kSDGc0WTfuTQuFeJJFLQ+oLOBEDDF51goa9bwFWvg/DwuHxT1XlupAnDY9sUNRGI=@lists.linux.dev
X-Gm-Message-State: AFq9FYJI695qRSPaTqJYEqe/aXdgv7I/JrJbcathj3i/iCOAgo8HniBx
	tBVU1a79cK8gk7uXaq1GXGeozXzWaeybkhdS1Q+C9BxD0O6uC1gpJiktpm1R7E075rUa9ejMKWL
	mkCoW78I0zfvzDnrl6ZXDHiXfKo87buGOmxNbIEH7BQolDlkmdnFGnag=
X-Gm-Gg: AYBFou1lVG4HJOsB1ibbxo0bkBCLvdT3hOCQ5rsykmL1b9iun+WUC/GSt7drFe7xPWk
	n+Ev+JlmfbQIcK0NP+heQei1EiGlPJ42mJrXESJuB3fsugFCYmUKzCaaucklntInYPR9nesokmg
	mXL5F5l6/c2VfUGiJ2KPZrSuzLr+lQKXtuyryyV5jB6CIj7i7xfxxzdfh8eqgeSeXH38jT9lvP0
	x6YzK/COXViziAuWGvIdXdprU5Vcm9oI2nwlSwHxk7Fcv0NwQKAio7gpgTPDRS9KvGJcXE5GvO2
	05Vy28xDFKSN0y4SNqTGAJmzq6KLG8sTkd8Ny0JtkHrU+vrGDATruDvwVqCHtZ9ufJ5lh4O6xZj
	8Dt3rw6bgWo7FtJJ7
X-Received: by 2002:a05:620a:2601:b0:93f:115:7338 with SMTP id af79cd13be357-93f29d66830mr1237946685a.54.1792410383091;
        Mon, 19 Oct 2026 04:46:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2601:b0:93f:115:7338 with SMTP id af79cd13be357-93f29d66830mr1237940185a.54.1792410382478;
        Mon, 19 Oct 2026 04:46:22 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e19ad17esm60581775e9.3.2026.10.19.04.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:46:21 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:46:18 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: sm8150-hdk: fix FSA4480 address
Message-ID: <rpsezddufer654mndwogaguvriun4i2lhu4nnosedz2h34qnfk@s44v3tjrrnnv>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-7-86c05068efc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-sm8150-display-card-v2-7-86c05068efc5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dO4i7KA1x2JqIE-3JWqEzczx5m0q_sq6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX5yji4m+YZfXT
 6p5KRYEq0taNE4YPzCdotOw2pdy2CYdqOTsYoUP3riKr/dmF0K5TVpYGVv4vpGen5OWuUW2fxsi
 ixPiTFHZH34Eoh69ptCnjxUs49gRE1s6/JC8sMDIIqnLHzpZN3dv3Vy9SWw9F/kE82uOr5EFRZ+
 cCfOhJDrt98sI1QA0JIimFxs3JgJeY/Cb/OCfVISF2ChbRJGxDnhr2GeWO50O5i0OGJ82DRTQ4t
 olXJR6Nlagtx6U37K9SqlY3ogzd/JzvwkeDAGQquW/4CM5L4d4QXp21wevLwyvMqqDUvMJ6pEJn
 HZIncY3254a6G9MOFKhXac7wKZ8i6YyrXuqL4Xy8hBs4r/sHtrFB6Q+Pc9ZZOmUYTDwgAFTaxas
 yOYVnFAcdFDpvzx8LuNAPJ0u0HMJzS0Uw2oifQrGWTMaafijjqkzIeuucqLxTZlm5l8KYtAQlOy
 vReAeDOX0IY9f9Js7Hg==
X-Proofpoint-GUID: dO4i7KA1x2JqIE-3JWqEzczx5m0q_sq6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX0gbcJqwTl1wX
 Et9XkZBjIKXZHWF/ndqpEggAU6PL35dVXKPpqIlLfYilM/BJq0bn4FSCd/AhaW5Nr2GsZnsRav4
 9R/uqb8BiBFFTVZo59unUx3X2hY3tRo=
X-Authority-Analysis: v=2.4 cv=cLt1IVeN c=1 sm=1 tr=0 ts=6ad60310 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=No1CG8Rj059PRq910ZoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190046

On 26-10-19 14:25:43, Dmitry Baryshkov wrote:
> The FSA4480 on the SM8150 HDK responds at 0x43 rather than 0x42. With
> the wrong address the mux driver fails to probe, the Type-C controller
> and the DisplayPort controller keep waiting for it and the display
> subsystem never binds.
> 
> Fixes: ba712fd55c7b ("arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode")
> Assisted-by: LLM
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
