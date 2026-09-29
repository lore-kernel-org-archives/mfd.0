Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA83526A80
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688033; cv=none; b=LAb04ZzQETVkPCa0qMuBI8DL2HJh/3v88fgZgIGIOm+KvM/2VyF68AMwtAEq/ob6fWW7VSA8uzTiI1tMk2IK0soVKq3QL9WhyAIUon3Xsr45KEUwExAp86bTsVNnhgU3HeiE2oi9Lje+UiBupkfdqhYngdvsEQuXd+6Wmr9NU3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688033; c=relaxed/simple;
	bh=32Y3KM5bCP1SDuaXQ/j9zM68Tajy2ksHRzCJwpZJBxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqQ85t2DWOofQM0FoHg/8JnMGf6op10ld3vV3S5P/ctltnu5ivc76uHU1M+C1rpzOVAa+rb7GQRH9A2eV1hTjRSghfzKIBJD9d3wwyZy0r8pLmfP+85+flQyqysZeRdQKgJ99tLzn0iAOM9CK2r7CBufLt2LCwlSUfx4emkBsGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cp/W5y/o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GiODplez; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cp/W5y/o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GiODplez"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqfYT3842777
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2T5RkWVrZxsjtjTmZsWjGyBA
	n0522HCwfBHwVcNib0U=; b=Cp/W5y/o/+r6C9nXhvcXSn/xELYr389Kp79ZmxpG
	2NuxYC2uWb3p4qnbwPzT9BaoPfJI6QJ86QPZUdWbHY8+CXI9EOBx0DosSa3FFGPp
	MCogYlNViyzj8W2bhLfan3joyFqF+yFUoISr/VUpl/RGAi0Y4RtQQJNADArUvzhy
	dq/1yoUcTbw5wCW3wuV20yx5ur0F1GSUTkB8QC0Iug4Q3tVQpt2J341kSeiGUEl0
	13+PVopSgwLyNDyRwv4f5Oku8S7emz+aoURwVpSzUl7kZ1UCw0e8guoUjHkhuxLx
	q6RtxJlTFRkezp25r7t/eeQWMkgtpPy5BcrJlb/XnLUa0Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0b0v8v4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:20:30 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7b34a3d1f9eso682812137.1
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 06:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790688029; x=1791292829; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2T5RkWVrZxsjtjTmZsWjGyBAn0522HCwfBHwVcNib0U=;
        b=GiODplezZJiWw3VTOc347x7xAUETi9lZOutP4JMgFzFaAZwl8qc8rw8svs8LmvRFE4
         1USJ3BR6I1d1hswOJdoRi3h4X3loOiYF7LREyhn/fjLIxBYuoHeROUYas5Icp/rLcu7g
         L6EMZdmd6rg6PITtnk3FMmWzCF6SnJKbw+ftpFUBXPxpVJeSqnWNnfRKzxQoZO0Q96Bc
         xBVuYd1kCCGFp3sTZS5Gb/+GttzZKq7/qhpvjHkqhit3d6JoczWGPqYeUlJ4R8gXL23b
         l6mFzcZdlNunDc1vF9UZXtkFYVKWStnC9ZgM9Hoinvicy9aIIwA6GMpklty0F1y7l9v5
         nEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688029; x=1791292829;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2T5RkWVrZxsjtjTmZsWjGyBAn0522HCwfBHwVcNib0U=;
        b=1dF9oapbMstrAdgCWk2Y3Xv5QFrz0WtBcuGW1ieCLPzVKtptqn9JqRGVlySzu5eAb8
         oaCILwd0gqzkL4PYp8qovCrOhScP23EgUdiIeJ9FjAv5s1oyGW2CEFqWsRpc2gWCIC4v
         uOpbic053mOACy6h3AXVS7ga09fhC85geFdnxGKEURBLGH/kdQPm97e7JboyHUVKPYgd
         Es7AzP++DXuKPYlKDmAry1almmpsBV9d6UTGak6wuncvItt63SevhsTy4eMv4+MPFwiT
         856dvfe1I7wyg4xgRDZEuQz/LmvYRNa6aMVTBZicMgTF6g7LuZgb9rUKlVwlj4yLro1L
         LRIA==
X-Forwarded-Encrypted: i=1; AKwUvBwat5dlqt5DpQUsP5/hRgQ9OVpom+ZUEa5KgwIlyE1AXCOfxyRGQx8OzhTMjps43w6YNdg=@lists.linux.dev
X-Gm-Message-State: AFq9FYKnLnV6NlM4MwyLYRNvpL41IMzJ2QKXEU6nWyhUByUBaTbtaQjs
	f6y0imBUwbmgV77ukojuZfTjMy/hKkwLXvK9JgfzoB0iDyitnEZEQL1Je2EcOG2j6oeEprP/XH+
	nrensqn68CSMrPjdf8tX++N4qi5peXvpcAyU4QN1G43RrWreTHDTB3Iw=
X-Gm-Gg: AYBFou0EPKxvaAFaU9rXyr7NL/yhcvCot9+YMA7Rsb+BhJJpQhxwJG09/SyO0LrLLtI
	67FgWqPD2oWzWvxNQLSJrCzKfLjsA7wbHML81d6kzyjVTNGNby8v1tqHzVWKMe9mAG7jaseh4Pl
	KGfCqrm/2FDjoaYexZSQ0v3cg8xOtKRljq7ttlEPGH2AeJkiWfREQyvtpB/LPWsD+WSKV5J1qop
	Xdn0fL5CKLx9944+thZK/K1WAPsLUHfO5W/Pl7As/OtI0cLBlK/JDFOn1UZjUA7eDJ2TeGXWdnx
	t7UbylZ9a190njOFxzxGUbKLw+yGeM1/I+px7haZsHuDDH1kteDNfVrk38WpmhHAnMRBIHyLTUT
	tp4t15bxR+cOG5sA=
X-Received: by 2002:a05:6102:4186:b0:7b5:7cd5:2a1b with SMTP id ada2fe7eead31-7b57cd52fccmr1747289137.10.1790688029386;
        Tue, 29 Sep 2026 06:20:29 -0700 (PDT)
X-Received: by 2002:a05:6102:4186:b0:7b5:7cd5:2a1b with SMTP id ada2fe7eead31-7b57cd52fccmr1747265137.10.1790688028694;
        Tue, 29 Sep 2026 06:20:28 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfec770sm82731695e9.8.2026.09.29.06.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:20:28 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:20:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
Message-ID: <kab7u3u7mtadzvnmknprujtjszdryurwjbwqgyr3aovzobumtu@y43okjkpzupz>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-8-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-8-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: jm_GNIhT-wYayVqR0pbnjduG7aJjrCg6
X-Proofpoint-GUID: jm_GNIhT-wYayVqR0pbnjduG7aJjrCg6
X-Authority-Analysis: v=2.4 cv=Z+55j3RA c=1 sm=1 tr=0 ts=6abbbb1e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=X6Y4kDKz15hUnpVYhMEA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfXzM4rtM8MYVMh
 4aO3VtK62wozxAX28YynmKaEpHHKiq5Www+7oDpdFyBTzC/5vbg8AEaJ6MbRT+T+c57aBxxFTBw
 W9c/aMTb3mrljoJQTrb3JBlsTOp8JV+n/Gm2s9ik5+opvZIYb1P6aTf6Q6O7pyYftCI9gQbqjrC
 Ncf9VJHU7XYS1OnIZOocGk5EcCBuBIrYDYzs+AldiA5TDHOxDoQsf2bibrQYFMh+auXo1UtfqXz
 bnQnzJxQcEhcHnNsayVJ++IbXQjx1yiGmIJ4lZc0SgI/1w6ZYtn3Wm4LchbJHjLjF9O4SNHDo75
 TXJQ4o2xm2cFLIesBI1VEnvsrI5e22u7m3pd0oFmHAZpEXrBOV9kD0A5YZOIc7Sgy9Cga2Uy64f
 I7C9zRdF41t2Zu/T4iR/vstxNbDbLJztjg9Sp6FvRUXh3j/823Hu8a+drl2yv/gYSReZ+uzz7m8
 TOB60YIrO1U/fduYAuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX7oPe/6xFm7NP
 8LNTWyzjYqZCivrL+CVPRtmPmbFZv9lcp0kfvx8lc/Q0zTBfanSr0DHt2VGqdgLRmaSqRBEeyOU
 l0Ad/iSZFDTc3mIu45W+5IFeGkXhgkU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290053

On 26-09-29 18:39:40, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm8550
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
