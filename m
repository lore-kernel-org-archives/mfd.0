Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CFD2459E1
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688075; cv=none; b=ECndxbpbiDSYUlkGe3w0dqF65XETJlXIU4EvRiAr/lsfp7rBJP/41/h0TBmLD67WbEIYhXIi9yrFvtpGH/+2idrNmSJYdlxSLRoAvr+a4oPJ4ZLu4wjjaYyhM38cKiEGo3zkyP6GVCnE5iQ//OtBn+wci2UFrXV2zBIS741qd/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688075; c=relaxed/simple;
	bh=3h/ymNXYlxSl9RL5neHs+6kC8pmPpSHO2JHkaaK92w4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oz4AGE1eJ7h4Lj+elmEnWvgKJ12o8XsbbmpJjO++4Hu3nFekuyppnyKu92AffCmmuY4X0XMm2nT9j9rPdTetHFQHzVcKSxk06imziSN3UEes8u42HLRhqdLIfOgUHCd1eH2AcTsVULcne2Y08y5spoS85ANwX4y9nl8peZDj6jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aL4/0DBD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WghQxvee; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aL4/0DBD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WghQxvee"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqgbt858071
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bv8dV17W/c4BxuznKaxP845l
	r+CLIZxBiDhUC0dcTy0=; b=aL4/0DBD4c385VnMkk/tES3H0IUBRk4V5rB5MLoL
	EUzZnUa8lCvqsND0aFQZrIhv1RirCP3RtfmtafD5Q8tTTGLy0kUT54r5dBTAE2eJ
	pdtG9RvL3YgGTmp6omDtkDFXsUzv7wNj3sWuYlNWzHIUSmslMMQVESuTemyz/EsR
	By95bCbOVQXCisNwUbbG2TWLxBjbWcf7opqCMEZ1JeQ4WBjOKKiDJBzOFgOSWloN
	b8tbmhAmMXoQdktNonpfU6z82pIAKUUcGMVoGx/I/LGZzbwfftxck1jKgijEUmwK
	qhUqTCfSAqCy0qZagDB1KNoUNh5yxeWNjM2w9w2KkSnVFw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h08e0hkt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:21:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a01d1d1b6so760669085a.1
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 06:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790688072; x=1791292872; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bv8dV17W/c4BxuznKaxP845lr+CLIZxBiDhUC0dcTy0=;
        b=WghQxveenVxwaaJ8Los3NYzV+SPYJ355OVb2cW7dQrmlNJn9RdS5WN09xFhC9o++g5
         aQQ+HktDkiWyqwGe/gs3OCEWdIupyjD9RfFbQyMU0WNrK6a28sLCFKYwtG9nsGLSQ34W
         Vxmx1uGCz01q2jUpfbAtww0mLe1G60GsXa37NmL9NpCKqTF8E/vfApYZxV28PsXZlTQw
         T0Heo7/Js9GzArnhIJyKv8MK+qThWCJcCh/EEJy7O/ake1gvxwItblV/6/z9gow1ozxW
         XVCWclqd4yYMJiU+oJLVGQR16HcLsCfqbHg+8EJg+ettO5uw2cc+eDp7t1n3I41aU9Az
         PC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688072; x=1791292872;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bv8dV17W/c4BxuznKaxP845lr+CLIZxBiDhUC0dcTy0=;
        b=QzxjUejiSlE4DWz/wNMCiO4CSq7nAVAZ9G2n7WVSAV2xqFPHUO7Cu9WjegTaiLLLsw
         cvGXQ0sldIyqSqzvSHqXbCZBcZGSwA/q66K066YUNK/Sv8ZGtYDubWNurv0gkzNKyEpx
         pKDn4iOoFsD3PzMLMpsOLxSPZNYvxtRjpHhd9xSS6pq6vxJ5/aR7yUMKP/yhZtlXGM2/
         9kvtHeL0zsBceM+sLkdh9SXuzEgmvOXtXRW4saCUwPUUEXjinqlR88gRwDQLIX1Yt1xg
         ki3wGDhoMo4TWqBDThkLvakhltvENMNkQgjXoyX6P8IElLbLEm6FivjFrerYWpfn9gG7
         4rWA==
X-Forwarded-Encrypted: i=1; AKwUvBw/BS+ZW8dNQz2DkV97O7xUhe7xNk5Qbp6hfBeMfF6Ouh8k6wQpLk0N97XsxjgFn5nGzCA=@lists.linux.dev
X-Gm-Message-State: AFuF++novbSFEkCFFAP+WDQLJzTOQzM3WJLNKfVr+NidYWAoj7bz9rQV
	ZftPNZ0IELYV8fzP2gDye5v5AYfEZlfubEyWZYS35mEEKtmuAUAIrpo1TRkgbtbkYN3q6fLQNxm
	+5aa8vDw75oyMGU2WbJS2g+v7cIP2xJDywXuu4WKNJzzMsIaQh9Le96g=
X-Gm-Gg: AYBFou2Z6hO7JstktkmRYmLMIGVjkn1OLgKYhMT//HEepdVh7V/6uRAROQZakyZ6YKB
	MYYjskvKcQzkt5Z4nTO6I9g2Mq9pkbRLSZsmCrCadBp+OVWpXySc0ZuxlhvtNkqaBHLUxfHBsDo
	Ft8OMMOCHI+I9b8UulK5YdjrWha/QilX3lb1qAW6hgCDglhCYl24J6E7SlnX1XIOgCX7AQcMRoV
	k20cKG8nibxfISCxv7qg98gwkwrWol8B6yYj4LRW1Mwvh0RuF02e69xPluyY+iO9s2L7+pUa595
	EAD8RvhiymWA7gpEvTsmtxM8iLzYtDKJozRorC5nMN79IaXDcNmBUJ46hQO0ToEAyE83ewjJ8WD
	myF0+Nr3gMoCvqeA=
X-Received: by 2002:a05:620a:1d08:b0:93b:d7a0:d9e1 with SMTP id af79cd13be357-93c43d42a19mr2688511585a.59.1790688072072;
        Tue, 29 Sep 2026 06:21:12 -0700 (PDT)
X-Received: by 2002:a05:620a:1d08:b0:93b:d7a0:d9e1 with SMTP id af79cd13be357-93c43d42a19mr2688500585a.59.1790688071199;
        Tue, 29 Sep 2026 06:21:11 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf2d973sm93403535e9.0.2026.09.29.06.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:21:10 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:21:08 +0300
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
Subject: Re: [PATCH v3 11/12] arm64: dts: qcom: pmih0108: Enable BCL sensor
 node
Message-ID: <2k5k4qouibqyynstutn5ffohlti63cblnatvhwjbo2e5vok3ww@yudt5aofkc5o>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-11-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-11-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX5FiScvQ1TYTl
 +xt9GVm0ym1xC2xOqsq7pSXmW9hK+3xH7ddHymegn6yjWPxSOFqjxokTGNBWJSGwZqZL6X9UvGg
 UFFSI0QrTtA1rOmsNSFB6kHeLVaCEp0=
X-Proofpoint-ORIG-GUID: g4PULMjsOGjVypQYeU5aH6vFOhlPMyN8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX4KNIr5B5MKSt
 TEaB2P/3M8A4xdHVtaE69trLBOKI2M5PZB9s4vdf9cParikKoRMkLpCPvacqhw1KPZFostiYghc
 uFGFbuxlkWgB+pKMZ3Rx/f1If+1PcoqfApiQHtWQtk96tGc3EJuaSRbhUWU6qzcwnxb/JC+v4K6
 +pWXBGkN6/KoiXW3LvTWAk/gX7xXCldOkuzy9QnHbubd7jzPQDgZU8xVdc/bzwU4tzX7AO5SB8e
 rQJd89OuI3SubKGmZqTWqI00xkKPMQ6qdTtBvGLs6dQwfdLkr2N4R35nN+sbatkCXfpad4L1rBI
 mRTwv7DVEczZNmyEBs3ER1+GfXr0XYNMK+4TW6s3PTH9xOlqw8UBzfDFic6gahzgxCZ4aBZeoVV
 9UGkMcwUNZJwROurLvAXPccfO8TIFcKa7oeQ8yRUHNlAYLIrOlaLJGukpS9VHiFJtfXOewGTMDu
 k8sh5MeqACtB6LgduMA==
X-Authority-Analysis: v=2.4 cv=WJ7qzXsR c=1 sm=1 tr=0 ts=6abbbb48 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_ybYkvnUm3iZRZ9voNMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: g4PULMjsOGjVypQYeU5aH6vFOhlPMyN8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290053

On 26-09-29 18:39:43, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
