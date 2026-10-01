Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECEF37756B
	for <mfd@lists.linux.dev>; Thu,  1 Oct 2026 01:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790819902; cv=none; b=rhfITrQSTK/TBUc4jbgQcd2CTSOnG+3zLnvC7R5RVgMxIM6GIM5zVTbSlzJEak5/lXhvBZmhTxEgC7QnJxP7yPhPvwn/BV0Ahvc6arcC85vB4Gv0E00MrJCzdWkH1hkRS2SMj+6xPAvHJ1vJZHwQTBxDTctm7TA8TMTHhzAsDEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790819902; c=relaxed/simple;
	bh=WNlxAVW9sEGah+tbexj/J3vs8zzU01+pV505LfFfPdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KEVayiTvG788AUyUc6JgvazIqJSW/YsFIvVhy+8WgU8+eReni/4By6bA2GC2TtZp602mfQR8ayH8qwBFJu5bSORm5K+VFdh49XGY6J4L3JsmbUrGMmElY0rDHFL5nNskTp9ggXm3m/xIVBKJGtpud3gaSG6yFT/T9fXk3grrBvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Av6XhOcW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ynb6Sshy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Av6XhOcW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ynb6Sshy"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910jWm9271262
	for <mfd@lists.linux.dev>; Thu, 1 Oct 2026 01:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZdeAUChydPqhPIvtw0cY1t+X
	ErxSg9azs+6bi/qs5xI=; b=Av6XhOcW37SpihgwTkGfs4qIDt0nNlPqo7uM+tTP
	csNja1zSArvVgJBXalT9UdhucfFxx30xWP3vbe9cMp/ntSP2ByZNm90EG5v4c7VJ
	oJRM6K0oQAo2/W6sdLegXqhDjNH6g0ZWQl4iej31n1Jnf43bB7ZmmgH7nRQ78Uvt
	CyODMykncY4RRlobcyM8BvdeEg6lyJpGykgjRJg5dDYHUGmGCcvmRu1UVvwOuJpW
	mb8tx/7QI09N3Q+Js/9N6NCgSGYOWJQ/8t1vMMmS3EsV9vI+8nS8lm3nZpdqimoq
	BDGxotkozDyWaDVXRZGMY7T2nOabY3jC70ckSGuF9uyvGQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17mvsfpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 01 Oct 2026 01:58:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb93c874bso48827185a.0
        for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 18:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790819898; x=1791424698; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZdeAUChydPqhPIvtw0cY1t+XErxSg9azs+6bi/qs5xI=;
        b=Ynb6SshyNhfurwhPlgBq72cMj6I3Z40J/oBfKHM/nlm41IwHzIVi4YKzXRXhIW3Vyq
         2r39TYEbe+y8ZiQGhPwZyBOxUKEGW6dLMM9jyVme4en9f2kjmowdBnTxIJ1M8lMg4QkM
         AHOF3OziNtMpAIqMfWCweRjXJo49tDNZMETKi/N8SPLN7Dhs+sNQrRkJZALb+wR5wb0c
         CLU8dsEFVdI0PBltTAm23pEkNjYq1HsZ7+VYeqI2gBLCLnrtSKdlaGi8pqJ82OEb2Kjf
         pjDMDkkx4a5qLP5hx+ujydvWhJI+B3slAxu8wRQEK7PKbAVnFHUboz2YWUNJfET1nFK2
         Efnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790819898; x=1791424698;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZdeAUChydPqhPIvtw0cY1t+XErxSg9azs+6bi/qs5xI=;
        b=ADq4NF9UOIE+Qlq3KWfls9xGeU3yGXQhtEhqSSDv6nnYLR7Mz6HkT+z7gRWl+uw1Ey
         tPoj9yqyGIYD/XPHZ/JTncRMeXmwzUonE9bgCE5Az/kx6JRhhTaconJtzr14aL7V03/J
         2lYbriDoUSvAllcEt4gAKPbzzDMImr25HsGL35cvlWos/Fya+/vlwirgi28xLAOka1WL
         5C5YtIrxJMNFG98g2zxOOcU5J//EB+CfqbX8vY5zSW/CNTRWd6RbeJpyhq7Oa7CgYYc3
         CyCbIDjduDoECDwHFlBw+Y9AoccYNUa3Fe9fUzOq+Sdhc2hGNAlWofunVrWMS3b8uMJC
         Dn4Q==
X-Forwarded-Encrypted: i=1; AKwUvBw6fse4CgAQSjGP0CCORp21ABBJC7HbQRRrrp5tNt1qDu8jI2cuAZm5J0Y9MFM7toCztx4=@lists.linux.dev
X-Gm-Message-State: AFuF++nCxrlXn1wmSzbCa5BPNjZdLRBstAX25S81AxGTDwOBU7YgR326
	oaTutRCx81cJ1xz78ez6n1TpiAV3KjtFWh6gpXlDhFcNtKO20tYXqmPHyq/NLJGdbspQGSpmuaP
	8BvP/j/0mxlSGThKmpokDaGK/8BTD1shlOwTWa7sS4hFJNjW2zB/uFfw=
X-Gm-Gg: AYBFou0B3Csv8iFizQKC+cVuydgswjL0Lok5fI+BaGCHeEN4xqVh9XfcrQElw4beqJz
	e9HJ3FnHaps0SCi1NJswlStSATSMyBmdLIKxWu/B612FAWT3pHB5jcH/KAMVzg4rosvNsF/7euN
	Pl8lCjt66aQm7iqOuGL+5rxk2mn98L2++lyiXBqgxi9cFa89NYrbE4JYZOUpiu3xBNWjkQjbdo4
	sU3iA1OktDCULnWP80NdZP064CqAR/OaAiwtVXhjCxh+MWXVVLVxiofpkU29CHNDZvUPnK9X7+R
	uNOLpDN2LeJ5+szal0h+3qSEIe8JMu3B0gqgZEZcplo9zYaFgNbuuh39a62JgzG90ndIaTfwkud
	obcmJT2C5EQ8HkndSRoHWk1Vb+5bAixGX4wgsGVlpMcQkL6kea5Atzn+OKo5ArBOvpusYhl1IVb
	JrOkC5n55W4lIy
X-Received: by 2002:a05:620a:2991:b0:93c:aa6b:93a9 with SMTP id af79cd13be357-93cb5c10d42mr278081985a.32.1790819897737;
        Wed, 30 Sep 2026 18:58:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2991:b0:93c:aa6b:93a9 with SMTP id af79cd13be357-93cb5c10d42mr278079485a.32.1790819897286;
        Wed, 30 Sep 2026 18:58:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba440595e3sm175732e87.8.2026.09.30.18.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 18:58:15 -0700 (PDT)
Date: Thu, 1 Oct 2026 04:58:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: muzafferkadir@mainlining.org
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
        David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 14/19] soc: qcom: ubwc: Add UBWC config for MSM8952
Message-ID: <lxil5g2zx3gr2li5ola6xyj7khwfltzbyqfuflqygrcetztryu@mr65up77ioec>
References: <20260921-msm8952-initial-support-v3-0-b96fd3fe298b@mainlining.org>
 <20260921-msm8952-initial-support-v3-14-b96fd3fe298b@mainlining.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-msm8952-initial-support-v3-14-b96fd3fe298b@mainlining.org>
X-Proofpoint-ORIG-GUID: f8-blgb9-RC_BSX1C9i03zwRO9-P7Bj8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAwNyBTYWx0ZWRfX0NteWMUBkv3H
 LjDXQWh1i+VqaUHYHZY7jJ9cg2DP7pJ5ry/x1zBdgttfvACwPPFA+AZ4WMzwzk7gvv7o/7nvCv9
 riJoJXYJn/TMgxMKsTPuO8nuukgMgWGIzenDx+x6Ezr7WrUrzHbhONQ/wJwse5RuSWsw6vdsbd7
 91/FEKGif3vYDSkYIk1WV6LNl2RScw7nMy3iREv44vkG9NiJ2qv6FRzurzv9pQyI94i56dMSL9X
 NOoDdoSruAlZvz82ptpxgPDfJiKCWHSWn4GwmsafDGMM3Z2EoW08LJgeK6lSFdTLQrWbpHFb7Yc
 2H3NMwEjwZ5sc3AuhtxKnVMc3kneCaIP4YaGqTDyWlkJ4CfIrWCdBiCQmvc605WIGEF9ayBMA2r
 f4o7kRtZ5mVES/q84JNCUPqvHe2m9Z3CaiwXdiuMKt1k0Kyo2Yswekm6HjnPSaGj+PClYgsfj37
 BjnE6rvfun17M4TiDeA==
X-Proofpoint-GUID: f8-blgb9-RC_BSX1C9i03zwRO9-P7Bj8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAwNyBTYWx0ZWRfXyainotWs+hIJ
 U5RfTWYB8w/1OKxnyMOE5bCmXqqW9KxokL+JX2oyoGx/ahqGsqpMBAz6mngjkuzOPGgYWFB4pXz
 aGHrTkDLuUZ4tvWWB/O+5ou6xyaWiFw=
X-Authority-Analysis: v=2.4 cv=KuvYSmWN c=1 sm=1 tr=0 ts=6abdbe3a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=OuZLqq7tAAAA:8
 a=EUspDBNiAAAA:8 a=bqz1LMNPX605IxUfdh4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010007

On Mon, Sep 21, 2026 at 09:19:05PM +0300, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> MSM8952 uses Adreno 405 and predates ubwc just like MSM8939.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---
>  drivers/soc/qcom/ubwc_config.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
