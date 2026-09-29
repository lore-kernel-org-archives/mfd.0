Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C61934DCF3
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687923; cv=none; b=MM5M8ghCiSeeZKTC2WlDxbbBtblzYpTguBlGDhfBIBZn4AsAehnxVl63LSZT5dOaWEFpU/11nyK+6dLJSuB+qOGETLh3pM5fQZruo3zl+SJaQT8LnBLdhR5VAx70+MGQ8GebCJMYsVGHSYL4pdsnmuYgFzGg0sXYaiYVmuFl4WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687923; c=relaxed/simple;
	bh=RghKvJeq/ErdFxSsLNsy/c0hNkdHN2XDzC+ZRGXIV/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ExEhPaxcmD+x3Wd4dPfuJv2X4BC0xYj3WbhJXjQyLMWoDbmT73fkUj8jr4an0og8uSSc/wBdQFLEextS3d6z6LyqYbHw/8RS7tkkE9jrN6/yTczTfC/8a4G1jjpCApnTNlNO3UT2F8lIMhZEZOx6PGWWZVcUGrbOn8fzpLYs4G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CiJ3Ojkj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a8JAHy+L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CiJ3Ojkj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a8JAHy+L"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqcig3842728
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=acJRYFzUEXib4HZN5FmHHyj1
	2VqTvFrBKT3HaFCEHIs=; b=CiJ3Ojkj0QB/PSzR+k1LrgEN1IfV0teEtppCAz5M
	BIVpvRFx0V9mPObW8fHRfOF/xgmfhWnndMwT0S96DQH5A8hpoEjm2G/CRviO5eJg
	C1iIqLiaULNFiEUUFYP2wuVkjSRAyUbd9EEYV85rDNYcRfY/FZzrSEzP24L6Dt/J
	ND59cZ11AbMkFsjCY+GLuqOGlbBqHLukPauhFqKkapqVYxUc1Bas/1Jj6mxQMtel
	XRt54bdbNJGPiuNM1Y25jCSbaopwK4wIk9kVL2qzErY7pdlYTP8v3GvePY1AV2FO
	fPaoeK6g4WcntlJ338Jkfak4c3oGTaJFRHGe9d4PCbLDHA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0b0v8ux1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:18:39 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-988c7363ee1so201629241.1
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687919; x=1791292719; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=acJRYFzUEXib4HZN5FmHHyj12VqTvFrBKT3HaFCEHIs=;
        b=a8JAHy+LDq7WJp5A0iVO49HPVaOB3TexXuXQ7ECqY6uKboKqcEiQ5cabHc/++4l5kB
         B+DAxcruaRma/xT7pW0LLGxeQy25ok7HvZ1h9c9wwW3zXT3RrKAkzuKgWl18F7b99JSs
         2lNufwpfhLs6stBP+3/sIP+9S3mwb+sFyCi21cbDZW49Xe+CEx78K8jTLNLyT01LuaVq
         cFgCGv7denvHXZrW3NkK/KrsliJCeIU5i63997nl7l7CZh/7dlGZNwQnhmf6yRdTzh55
         VGywFbBrlkTjp60r3XVdXK0JebhJYYloRv/OYnbKpDl5pga9zVHHBAkJQC54FMq5/ALj
         Sfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687919; x=1791292719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=acJRYFzUEXib4HZN5FmHHyj12VqTvFrBKT3HaFCEHIs=;
        b=CPfhxAMANMfv3OleDL9It9r96DUq1vOZlKUMsiwaQs8JgmkRSPH9kOCVaMgx0vFwBF
         B9fvABjSgrovX3OXIyzeD4fuymRTFIqAUsdNL7iSxOmBtcGf2LQvjCjyBTaBKyJFOE/I
         2PzclKA0+U/2Ss+wHEG5mT8NswxDZOvdnuVw0B9QMl/OzS4g8f+7t5npv5uz05tV/PyX
         NjkvJIAIVRkPDxpUmVzVbBdPrPq2oZ/itJ7RYMA/0+uVta4L6M+9cBL/9vGG/bb0xefh
         dcEXJsFdZMSSyErbiyb+2fjLMfFlnNTiqjSEl5nS4Sk93/Cbiaoomr4VN7kko8JxENKs
         enNQ==
X-Forwarded-Encrypted: i=1; AKwUvByEgmePjmUZW5eS3SRfIpaeNt8iUCP/H6oe6Pva6fs6/Qbs9fPXjuhl08oRmGqUxCHvcpA=@lists.linux.dev
X-Gm-Message-State: AFq9FYLl7cRdn4W4xSk1pU7JTlCzklhM6FxyquLkQT94iN53j0mDx02M
	AqNzv4xiq24iZkCdUl2igWzLs+FsBglwkG3faddc9rp9tY6SzMgOTPllMeEKZi+jS4ZS3hsRvLP
	p5b2ckO80btpCLNW1i4T3kJE6cVgDJUtpfUK5DLqjNmkWUgB5T0CdDao=
X-Gm-Gg: AYBFou0sHJ2nUQ9LRCAiykLmSbfguA0Ot/uYiY+Qrz2rYRawqzl1/keozpoCb+Mypk6
	lMVDothNKREBAlPe1pZZZIGG4+o32sVDnA1poEhStYvjkK+a/7K0HGWVoJxZkCeVU7SZMqTSr9Q
	z/BOrxgfd/DnziFq/HaRnYnp9x1lEwc/aCWG1s3CDRuz+Q1Ecs1+6hFGzzkXiBW4r2DuTeGNwbn
	rghdRT3mUK08QZEwd04uNUL8aDyk+UYr1nhSmPFpuJvJVV1B6ZXOAct2ksafVVz8zWC3wnp8rTR
	5eVBM1YTno41nR0f0tKzRFqoR2hC/ZG2qWJwxuILF0n3WgW7as7wtkqWNxpmHHIJ40LM4nFjX4a
	mQEBVfhCBESyJqDQ=
X-Received: by 2002:a05:6102:5121:b0:7b4:879c:bb8d with SMTP id ada2fe7eead31-7b4879cc104mr2523125137.37.1790687918787;
        Tue, 29 Sep 2026 06:18:38 -0700 (PDT)
X-Received: by 2002:a05:6102:5121:b0:7b4:879c:bb8d with SMTP id ada2fe7eead31-7b4879cc104mr2523103137.37.1790687918083;
        Tue, 29 Sep 2026 06:18:38 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af509658dsm3582704f8f.32.2026.09.29.06.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:18:37 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:18:35 +0300
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
Subject: Re: [PATCH v3 06/12] arm64: dts: qcom: pm7550ba-eliza: Enable BCL
 sensor node
Message-ID: <4d44yw35rdxvkvoufiyscumsvzrslgnvzoqpcqs76m3qn53c46@tk4rbs2xal2e>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-6-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-6-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: JQCQLbyeO4WeLT4mk_uyp9WT4mqZJ-FI
X-Proofpoint-GUID: JQCQLbyeO4WeLT4mk_uyp9WT4mqZJ-FI
X-Authority-Analysis: v=2.4 cv=Z+55j3RA c=1 sm=1 tr=0 ts=6abbbaaf cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=GBzGvGGi_yB6IOxyoawA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXz9WEnSHYJ1D6
 HQC5p/dJDKk/UPyo73iO+vHFgjkfh3Wh2Tpo8hwt4PEaIz1pets/UbXILfQ6SJM8oHxZAcjoW34
 l8exgBOKR1YW85ixthCEbUmSdGc4eq9asdtBxFGLXVzuRtPMTVii32D8qW6tzmWhwpSb54Y4Jqh
 z7Zr657VZm4dh4bGex9GEMpJi3iWA8Se1+qU4rqZpg8567u9qrVY4wihy0C7oQwaH2Vi2fEwNWw
 IOx+SkZQ/+LHlbfBgsh8HZYw7WuwVXd2MI26eUSuJXZInu+WGWX9vd/fl31pL0O3cW1V7lcUSNl
 6XFFRtEXNnhzEtnFPk6NJTDqEoNICU4m92mMzNbkVQwiJ9LZrBGRgl7oQqrKWUAwtwm1G2sdOoD
 vPwwfVyYwjdNJh0SKnicIEJg8SG3ufTrN6LjbptF4rTAiq2f3vxcAu1fq+eisdFsnuWFF/fNcng
 v4goxoa5WQ5bPwNPCcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX30JJUOghjz2g
 O3M4fU4qW20leQnlNsDsx/EDbGWqlRy4TKA37ZjvpI5RadTtrvVit+UOamhgtuoLIEsMUyXskkJ
 +j4lpdwStN2sYn8BQyHlOUoxZ+lhyiA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

On 26-09-29 18:39:38, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for
> pm7550ba-eliza. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
