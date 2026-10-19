Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC60E4E50DC
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410412; cv=none; b=HJ7Ce08JeUC5h0wRJb/bWsBGyDlEvxff0TYTlghthALtvVLRKF2suONdr1DX3yoz5rbn8Spgrkzjo0dzs65iK5IhIzeGg71E9CrVFYr5yg9bpJonaUV8p1xu6W67zYLAV5cPSZ/QxMtAHaxxkXr6DikmG3/U3uLhNl3oQEI4vmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410412; c=relaxed/simple;
	bh=RIX7bWfkRL3dgOtEB0g9h8nTmYWL3ZH6w2+XB9g1exA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=To4iMok1i3/1eJWHP35+dCTmppDOaZbX7NpmTi/7r9Gxur2qgz8KBsqDsN8O2h566OMgeT7frnPD0680AnVx4NjcM/FrybWqGgPvS2RON/UUby8gQ95BpJxT+NlmovvidrOM3Xi2EUsHp5k6V6u7TdfjUh8b0Db6Q0dQEppudZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqhkTMBr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VfYRWTEn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hqhkTMBr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VfYRWTEn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OscH1348210
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wq7xqxfmXPZkOoAo9wJ+7Vs0
	paly6CmBu1OanMzWHA4=; b=hqhkTMBrFAMM76BtlZZFoX7pQGmmWKCVYbNC292q
	kXd/P00LzcmReia+FM3AlkQkSqpziCdz6VuizoK1+MTk78YtpHYKDACngIl8/fGG
	s2UqnSSrORZIsqZVHYC1+Vm2JsWN1dUOGCSVVtk0quNBAO2KoK4rtzd+UFqEktGR
	etojQmaat1QHyhcGFFuI/0QAxdrHotkI5JWV0+NEcToq6QbypmxwvkQVdptSSZS/
	VQuvIKNJKqOw7J71PRoaOenonVRjMwZ5cFWMTDjIlQKjahXVPbR0GM+mzyzXdDdP
	NOgVWn/QjO3yi7Rm2Rrz67BiEuI6jo5SKjGFxAjF+/UqgA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rgvkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:46:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so709776985a.3
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 04:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792410409; x=1793015209; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wq7xqxfmXPZkOoAo9wJ+7Vs0paly6CmBu1OanMzWHA4=;
        b=VfYRWTEnlm6JOSZ0816w7yZ7BbvDO3ctCKAL3cCad5aNvfC1T6r1KKSikG49LXaGfR
         QpPqNt7oMgX4Lqr648WLVdxlizK15/RU347qCYhUMxxWYjG2RQSq4NW/JEXcgYaGqo0m
         ol2xgjJrol9QwjkvsLytYXm7IncvTk85k8ucxs0iclDMo6YyV/i+tnyad57NWMz1Ua9J
         dJ6boyg7osJ15FuixCz1S7xZBcJSwWaqddvppBdnHzvxz3O2DAEG8bWlCNzrPMIC5ZhO
         cxU0DQk3soW5Adqbohf2Qx0odSTo8AyQTqzV49yQ7rDPRDEtNNKZb7PWyHgsUvpSqWam
         N4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410409; x=1793015209;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wq7xqxfmXPZkOoAo9wJ+7Vs0paly6CmBu1OanMzWHA4=;
        b=mbIDLGUXg8zBJd3exSXuFnO9FpyJserEl3uxm9S739B+ya9/X8IkT/qTnDxz50j5NO
         piXcwwrufHT2w53vLHfy+6P9UiN8CjHS3NMD8iPs9hxQP44LGsk2gClfw1QvfXe3Jkv4
         vurLwHnDee5yWCiCulD2AqwAPWshE5SfER1aP+4MGlsRaucMQ0JJOu3Cw5DWOECVhI+c
         WcJRpKylsaaM9Da/mp9gP2eNOj/n9jAC2PJTb16hsmEVM6wsV6MSdmX0qZPNwJa9/vuZ
         Rh1hcAeK/E6FiaBW1ugmaFYD40rAXuZXwO+uJKyQYbBywaIybO3vPatbE0ZicoiGcJiZ
         do2g==
X-Forwarded-Encrypted: i=1; AKwUvBxTXQcaCwSn8Q4s5pkhWoM++2L0TZYO8IGoicigSVIRyg2yA6Wgr5JwfrE+hs12lJSsfJY=@lists.linux.dev
X-Gm-Message-State: AFq9FYJcQWEE9qhXgQgh+XU+77qQOT2j44VYW3LWc4rPthK+upWbD2K9
	CgHcZfAVVKQYoNnYvCyVk5LZSpJv103HIRTG4SvJsUxtuu/BgmlbWvIHoEb718MoYlUlKeTa/XS
	1ShiqlJDgyR1LalMyKJEet66+TYisXKy8vIKC3SAo4M4irnKSDBD8hLM=
X-Gm-Gg: AYBFou31uAqMwDIGnFZ/HsvRhnLiOjBqFQE4cxTVihvETsso0thShkzBP82YpFwMtHe
	EUHwV+YiAPASRb/hhOUZIsjGM0bnOJL1xWiZOkw9qsVlrTeitQbXwByw6IPodVhl+pgYTM/q78I
	fFsgw8ANbxhbFWRaDYRX3icq5tHY1yPxCGJQB/YOh9NzXZiLw3nB/IKvTk6n0sHdsbugWwGoo9F
	yLtfNuuiGNqeWSGmICqGDXBecaGmZy5zL79fvdwFYzKFivdvII8Qwy02XRZlBMMitYZKqVUnILp
	EFSd1x0dOJdlHkbZPBnVm8R7Ezt+5thkiGl9w3gMgnDZ/HbeCcw6SF0EvJwqGPwSBloyng1niYm
	cqJiRuO9JRmK29cw+
X-Received: by 2002:a05:620a:390d:b0:93e:4ede:8976 with SMTP id af79cd13be357-93f29ccf82dmr1357035985a.26.1792410409011;
        Mon, 19 Oct 2026 04:46:49 -0700 (PDT)
X-Received: by 2002:a05:620a:390d:b0:93e:4ede:8976 with SMTP id af79cd13be357-93f29ccf82dmr1357031185a.26.1792410408368;
        Mon, 19 Oct 2026 04:46:48 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e9423f20sm58333795e9.7.2026.10.19.04.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:46:47 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:46:45 +0300
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
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: sm8150: add MDSS reset
Message-ID: <m6vg6jper4d7npmcuk2xwraitcprdvuuxsznyxgft22ankdxcs@robz3qiz5ivj>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-6-86c05068efc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-sm8150-display-card-v2-6-86c05068efc5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: EautlE0NtaHui71QfG0nx2fhYUfQj46P
X-Proofpoint-GUID: EautlE0NtaHui71QfG0nx2fhYUfQj46P
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad6032a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=8OGljtfnZDXdbyEkLQkA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX3l58fIMF0lwc
 JfHEyOwQmqzP+kkmoSSw7gh0VRMFzu8+81miivGan2gwChB5roY3xgScdDJq30koUPR4bqyAPZe
 GJneTfIKH5x5gn/0Bt8ZziMxNacvzo/D+9wKYj2WOAi7qPIl5bVXFgToGPKV3P5gaoaspmJgyCY
 0tEfGe7W0SxNW+eNXOJ5ry7C8RoJuodM1L/6qHgQE/HSBOIu4UT1QHrbxc/5U2GYo8W+2L7YYTq
 uSjTKX6l9PUGeVpy5wVSTXD09IhI6ay0od86Md3i29z3FjyNP7Lg7NH+iM5dZZbFWdXFbe40x9z
 b0E5eNrGgVJl1APyTfB6JSvTqO4H4k7LRfXXL2qtqhJiyfRMnQNHuxQAVd0IUIVeYM0wPI8X32y
 Vv8nxkQ5qvuH4j0WpGOTW0DyyeddGvuiaqJtzVLWZmk3Ts39TadwqAqhGOzO+QeCEC2wQDhw5wd
 hC8qDOKzMMjMNWNNU+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX1LCDfiLj55+B
 u+luzTpIoL1eZNGFTU6jAJSIHJ1k6+hNwEB4czBMUp+dy2sojgVDUuamVepfu4n9Mub6Tn1jvoR
 M7eJa42LKg8eFu1AeGs5vumHVxraM3g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190046

On 26-10-19 14:25:42, Dmitry Baryshkov wrote:
> The bootloader can leave the display running, as it does on the SM8150
> HDK with the display card attached. Describe the MDSS reset so that the
> driver can bring the hardware into a known state before using it.
> 
> Assisted-by: LLM
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
