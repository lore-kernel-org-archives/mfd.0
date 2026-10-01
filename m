Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792C037C93E
	for <mfd@lists.linux.dev>; Thu,  1 Oct 2026 01:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790819847; cv=none; b=dOKNo93dtZLclTrKZP7dq3xdUbXM4blNaTz9P00wye/zW6Qpd7WPmBbgm/SiWd2GisJUpnh+/bLh1ur5Oxi5uZxqAY1xpg2vzo3uAQOIAqWM/HiwVvfp8OsIbpzXEQho5hP6a6/M2E9J9guaFqytAx38g/qNXxOkM2O+BVtnEsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790819847; c=relaxed/simple;
	bh=dc23h0DAzeahU2YQjWsf1UtM8H72KH4uKWQYNEb1GJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKfjk2fqfHTrndV1i++/ZFE+GxzpjR9F8tET4dZs11I0wEApi5dG5JTLt7wl9WGc0UtQyxhB1xrUm8WUEtQIgkhuGVZuu2XBFWn7hXS9s42M1jdrCuSsLIVFz87gFOSPrx3rA/6mz08Pa8o3Qmjt1GI9zA+q1slcrp5dp2bdMwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S50noS3a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JvLnVkio; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S50noS3a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JvLnVkio"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910k7nv2013317
	for <mfd@lists.linux.dev>; Thu, 1 Oct 2026 01:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uoVV9AMom/z0Z5MeMxOVZrJn
	fnZMhEF3YGoQPtJPVgc=; b=S50noS3aCk+5o+zo395zaz85DH4dKB/5pNEcwflo
	sOOZu7Jf9Zf4L6f2HIIt2NIOJgaC39THUFZ5YJQLhQ4ZIA/9usI4JfGvnfqc0Asx
	0xG7xi6Lyw8j7eoN2QXXDGurmww8SjMNhIrwf1pzzU6/MY9DDL0mYa/WUwzLZHFG
	g4UtuhHxGQaXLZgYMOuLaVke4M013uQinV4XXShCcGSj49b9X216TkJlJfrLcDEf
	RYCTetkmOpdbhFL5iw41bl7O5SOFH9aLRSRNyUAwQctTN9BoBgAK6UMluDs70FK+
	CdnQXuFv/CLkLPfdszF6bWnckNNhN3iGN6k+73VZ+TnnsQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh83xf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 01 Oct 2026 01:57:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so82964985a.1
        for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 18:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790819844; x=1791424644; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uoVV9AMom/z0Z5MeMxOVZrJnfnZMhEF3YGoQPtJPVgc=;
        b=JvLnVkio/UiaAG77gKVKDuPvQCfXXJbFrxruILttyLsVyRqBSZWa83RB0E0P+3Ri3n
         CEi1IiknfEIv9PTk0HGMOn83SWtbqLFb1+JXr9tcw0M6c1XavYWDiSGSXa5aYcIk12es
         Gdf1mk46gLoHcCMAR0FczifMtgfcrv260U0iQxubgY00bsGcHF0VWbDNl7TrsL5jUl6R
         TNhqMFmnADnKnxUbrtZWGmTujbPXJ7qgxwHq5FkMgcOs9ikTaz5/P0g5A1uUJ6hALVH/
         xJGb31lg7WPh8Hn6LwWEfNPkr5bPe9CG5TzJ7HpI54w36zsdtH+G0cyjwxcn3jPXnsoO
         kPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790819844; x=1791424644;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uoVV9AMom/z0Z5MeMxOVZrJnfnZMhEF3YGoQPtJPVgc=;
        b=XK5DcF9EILcR8kQsvkw3p0t9KcHkvX2CDvoSY3M66rXAiKlO7g6poq5sMar95GiNdc
         FwFUGja7WehGOSURl1uiWt8+0c+f4yLGrVKMKJxW8vUCvCN87S3d2AA+e3Qw/N/WsKtl
         U9LFhlPN4ATdQdr4xIGxpCR1WyKH1CAKZ5hLfs6Cbvy7l0XUSYk/FixoNGgx+bp539fz
         cFlIe/bmj+Oc0COZyBc4DCKamUhP2WTkM8EEFImCunoukm15qZT9rSHotuSqL4K+n9lA
         zbO1sFK5r5zYsUpU0xFmuGGJM9dOirAefgQEYmpX/TuT4KrELoULHYH2PZdB4Tjgdjbr
         kpqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwChmI5YG796WiC0qVekMmZVGzPVfyaZgmGHlSIipUqDX6M30naug+5wW+uYOShxvoMMuc=@lists.linux.dev
X-Gm-Message-State: AFuF++lLarMxkrOlatgkmJlBEudIlxeV7eJ8E+V+wD+l7YwtfiLisxDn
	ljsdbhRV90HUdui8/FyXYXbZD+FL4Wx7TGKxvyWoUVxy1e4iBGTvYYhCfJBGOVBq4l+IxGZV4uS
	sRBtHz8s1kRWoF04M9TxZoGi0/hZevV799xw01yMj6ZT4b9k7ot0rWSo=
X-Gm-Gg: AYBFou36xH+g9a8KF76+KgNPVaZMcTZSJUuY70rYOR6Z8u4boAd/FE3xwpB4O8V+3XH
	j7ApVZwsPEFt1kAB9SGnM9TyGWbpmbKIxC0MPJGINin/Ykp9LdMVSwqbugT7EUEE014dCSGomoL
	511NUQ5JGkBPSHqG3dTodwqoaxfBpVlbqu3Z2bOxVn4fBhjdRixKTlZf5G+yg+5HXUl7OGuR1uD
	vrTF3uLUxci59wg5Yz8S+qTFCaza1shdILHPmNGNgSnVVsbAG4+khECuHTi6aKR/TkkhAV/+ay1
	K2ZVePCyudKTPSZedfk1gYHOA7RpI/dyIoESKbWsPOhV/fDAi77njrR+sdjKGo4AXpaAYf9qBsF
	9OQ6LIMD7kj8uqi3RubjmkAF75kc6Mf24RUDTnciG6X4kue4nHoXtK9tSwndcAA9TaMfMxo8Gi/
	T9422XogIYBQ3c
X-Received: by 2002:a05:620a:269a:b0:93b:d7a4:9d49 with SMTP id af79cd13be357-93cb5a1468amr287214785a.28.1790819843488;
        Wed, 30 Sep 2026 18:57:23 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:93b:d7a4:9d49 with SMTP id af79cd13be357-93cb5a1468amr287207785a.28.1790819842965;
        Wed, 30 Sep 2026 18:57:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a77192ee13sm12526111fa.30.2026.09.30.18.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 18:57:21 -0700 (PDT)
Date: Thu, 1 Oct 2026 04:57:19 +0300
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
        linux-input@vger.kernel.org
Subject: Re: [PATCH v3 13/19] drm: msm: mdp5: Add MDP5 configuration for
 MSM8952
Message-ID: <diibislcaubtwwazmkjsv4y732har2eskayle5mxpdkr5npana@uckh2yzblzxp>
References: <20260921-msm8952-initial-support-v3-0-b96fd3fe298b@mainlining.org>
 <20260921-msm8952-initial-support-v3-13-b96fd3fe298b@mainlining.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-msm8952-initial-support-v3-13-b96fd3fe298b@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAwNyBTYWx0ZWRfX4zAl3Eb5Qr4y
 AtKq9boFx6Q9qb0SOZ04aQal+Gnb+qoJF+4egjH3EK/HNqJjN2/CPH5Y5M5yizB50VE94aoCx1N
 orMr7h/kR90x1mf1uYwnUijTxigaUGKrJLDDtD+1UvBcnKQodjEYkhcr/odcGlyUtR9H9DEkaUo
 2vy/yCE6hYvIfVHXE8qiO0mSFeN+0KsDaKy4omMqbS2BWM2w2FjiXjPgTwj1bc2YmdqfXkHP8Qd
 YV++Iokq4PtY64GAqRjWQ2clzfwYJv621pb92VFzOsbY08y6t9uwNxd8bM8g9O6/WdBDGLoHb3G
 Ux7Ht6qbrfwcU3UVVNRGgEbu9Kb6XkSdTkyzRB0jxN48MLY+F+X7Mz3MaTp6uiUYcVYm/mDppm/
 cYiwCDSurUrELaqP48uYGsf9YT8W0unp0kHnRqyXwf+8V+F8C82SdyCBqRpf1cxEgKb6kRW+7Vy
 xGF9TdU5BILk6jUxFSA==
X-Proofpoint-ORIG-GUID: te3hOjf36WRddY4XTSwRclvF6TqYYc3b
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abdbe04 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=OuZLqq7tAAAA:8
 a=EUspDBNiAAAA:8 a=YvXxkWmvim7rQlE-Do8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: te3hOjf36WRddY4XTSwRclvF6TqYYc3b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAwNyBTYWx0ZWRfX7NR/rilLLXvN
 ffXS66jSR2T953JvJeIG4rhaBK15ayvGJ7dJu+gYUc50eAOumvOSLJmK6l55NYNWKRgENm+TYEn
 whPaZ/s1L/RBaxT/FH5RccKdiAXS92I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010007

On Mon, Sep 21, 2026 at 09:19:04PM +0300, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Add the mdp5_cfg_hw entry for MDP5 version v1.12 found on MSM8952.
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 81 ++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> +	.pipe_cursor = {
> +		.count = 1,
> +		.base = { 0x440DC },
> +		.caps = MDP_PIPE_CAP_HFLIP	|
> +			MDP_PIPE_CAP_VFLIP	|
> +			MDP_PIPE_CAP_SW_PIX_EXT	|
> +			MDP_PIPE_CAP_CURSOR	|
> +			0,
> +	},

PIPE_CURSOR is invalid and should be dropped. I'll do it while applying.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
