Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844133DD86C
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410480; cv=none; b=Yix9iWo5L8IgRgZxqHYAMyyJHjyvJVocA+6NkTfvZ5thkRkpljHo5dsHUrYpo/bq3gAszAAhc+5b/XV691A1K606W+Ak4rpQMtv7bF8X8gAwCu7oFu5Pa+0zL6t/QVfmuLnj5IF31Av7BnqwIiLQgV9ULIVFBVfw8ekRv/5jZ6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410480; c=relaxed/simple;
	bh=ms7BSnd3FiMoukV9tW0CfbTy8rz5XbhFMM302rjGkho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5IkgJ3linQSzCboVZg4nyPEMDh+drqWIaWfjP4oD+Se1/t1ovUZqJyr18USTfgCbrTxYbb6F6ccHwUI2SoLBoELmZhHYFNeNQW8YYXzCXTWKcBJsQhFHJR9uupUTLdj1ZPYh0QT/sK3UFwuhVrF0kgnoJcn/n+vIfY8Y5F4kqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W37H1eAG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RIxuwd41; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W37H1eAG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RIxuwd41"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8PClb2193384
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6Fg2JmWjJmbabOk9C0BRHqS/
	QtSPnqgEVZrkMmJYDlQ=; b=W37H1eAGqJuNpHajgHfNvWiBmHRMonKvZ+Har/aL
	XREv3Dz90mOkK1LB21+Y21PbRwkrbIiHlz0a3I9YLhfyQqi4h/kVNGpM1OBy5FCZ
	02jz5GxndLoxSOTs7grLBVrxe746oBd3PdDnFwK4lNWWCT4kyE0h+yU5U/SF6oXD
	bsh5rq5UjRZ+DNPyvD5qCkx8wok7FQRh8jGsvxlXwipCBTHN+HjupqQZw0ulTZXL
	Z5FjKZ+85zw4OEGDe4R4AVZe7AqSofxRgsx/5rStd4/OyGF9y2NHGjtz2EybqEd5
	qU8k7Qzuzzb4lvS5cwzU9ppIsV8g8XPxkeemXUCdjyyiMw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w1ahtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:47:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so461531185a.1
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 04:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792410478; x=1793015278; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Fg2JmWjJmbabOk9C0BRHqS/QtSPnqgEVZrkMmJYDlQ=;
        b=RIxuwd41uL2cR+0SLo5a5gqnKr80ibwLxY1SEtI1S1RxywbWTIKVlsQ63XAMdfbQbQ
         VdVGq5rRYwOphLhoyhg40QpSq2HMeGX5wILOBJZ26TbxmXeTiMVU+lPrvvX8dXtdfVqL
         P+vrL+7A7uFww3GrNTVNu3KbrnWKd8bVvnFGcZ1RtKjuT2ohep2hDV54r3rZbrnvkVUA
         IhdSQEN4qc7IpgX4KZM8EPkR49i9QfkoPWbiicpmA98QcDQdXVZaaIYyWnYLGAUOCg0I
         B0QxKHv+viDXJzb4ry3tM9EYSm99lRkeaUpm2lqbZRacc/LJwBAeMEns8el0ekXIRfZI
         +GCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410478; x=1793015278;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Fg2JmWjJmbabOk9C0BRHqS/QtSPnqgEVZrkMmJYDlQ=;
        b=V0rbXH9+lOGkMMX+L9Rbm30O3JjmFBDE7RYwpdlQhnyKzChlXc9D9bQ1jm4NmRil1o
         9yDNVozxKoCGICXGgBfVeeOBW0DkBKTwew/c293A2P91kcluaEBGwID2Wy6yCDabAth7
         3vXR5tODNuB5EUlflXYim/4rwnYwdivqA+i0rY/NRG+izFXSbYNEKcahWUpXjs7EN+be
         S76EOb1RevaxnpPPipIpom18m06S6iueSC7RAxmLRnvVuiOh+DAI0WYbA8X9ov++KiVk
         FVoeMETH+B8WHlW4e2QgLsX5tt97PwuP4yYq91t3TtfINPSW3/z862NDA13FZa3B2E6q
         bkgw==
X-Forwarded-Encrypted: i=1; AKwUvBwTdDt7jNaQ/dZAAtluIyrJ6VWWQv79T4IYi4FSY4yp2iI6DHOj0D0RptqzSHOODKJh96k=@lists.linux.dev
X-Gm-Message-State: AFq9FYI8CsNtbI35T+xMnqAZTzDMMo7/RSHMgzK+7W+tEfDadHG7ptCn
	Lli4Cc2KiC3xFTBztvv+ScOpjiCaKp/H59gckerIbQ9wQOat2zpUY6aSN0QTAZ00bp1lV9Rdgzl
	pM/14YPpBWydpkNrKm0Uj1XwbZovpZJQtlA+9jVDrUFPYd0OQBWRQCBQ=
X-Gm-Gg: AYBFou1Qqda6TlnODmT9H1PTYp6PZBlk4rYZ5amJAzbP6NmuLu6A22cASWT6OK2mwLY
	0A31nSrvcYVIyFCPyqH1kIIaa4z25UbSfvG+Z9tfeCfB4+XZWVr++1lc9qBGbWqNk79RaeseZsr
	DBsRqSS9oqN5DbCbbu250ynSwj4u0sqeaQL3Yv5HdvZGfroy3JfLx0+Nai/JLjrFBYzN5iRinJt
	wnKLCNok6w731rKcZG9WzNUtPklF89Xkv1fTRWltWkbVLtc+FEvPQ95B08WRfYooPcWkh+ovJif
	QPGJiXwiEtGI6UcIfrffdNiJim1Q7kEHNstNVdIrZT8loqFGukYla+3TcpryO+w09IlIiJEsr+/
	DMinRvvzFetvNR2ea
X-Received: by 2002:a05:620a:6f87:20b0:93f:2d10:ea49 with SMTP id af79cd13be357-93f2d10f8a8mr730720985a.45.1792410477696;
        Mon, 19 Oct 2026 04:47:57 -0700 (PDT)
X-Received: by 2002:a05:620a:6f87:20b0:93f:2d10:ea49 with SMTP id af79cd13be357-93f2d10f8a8mr730716685a.45.1792410476993;
        Mon, 19 Oct 2026 04:47:56 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5ad06bsm23495798f8f.14.2026.10.19.04.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:47:56 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:47:54 +0300
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
        devicetree@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: sm8150-hdk: add display card
 overlay
Message-ID: <zeuvurtobviw33jykidak63yf5kyo4y6api3bnctlvmxzgkfhq@bkxxhscma4st>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-8-86c05068efc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-sm8150-display-card-v2-8-86c05068efc5@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX2YLXYPs2R4+g
 ufjIH3GI2/N6r2cTiqHOc11tErF8/w6ilnMpDmTxytFrHKfbau2wCEpOM/tC2tA5n1XAm8//d0j
 5vKw0n4WBB+2eqjKYqJRinjmLtOFQC0=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad6036e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4ZraDTF-A1gCCZ4hMMYA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX/5CiuraCgh7f
 PZLlgVkKzr+/b2i5AXyXi28sn0xODJwuX519fXlttBLuV0RPB3yhE2122t4WFb+uwhAtIq53U4s
 +E9xrYqCFPRny/k5XTAgeI/n0Lz0hnO90TcOcvr3wUnpX5gq6grbHyLSEgMILECCIG4TswjXB1M
 WSYS9K42Cr60klVka4HOP2zPExK8syGy4354iaIGXAPUnNQ24lHvjQNGio/aRmhXegEsdhebCEm
 yOVZJtuOEZX4XO8GZlTwhYekwcfrWq5mMOxR6NauPikJCdhzcATDdBO060QqeBvgy8Dt0GOQh13
 6z+/5fS2rzycBYBmCnF54hxJHoa7TOVwxK3dwsgdLmRuE7efdMrgUFG71UYrSIH4Lw7rCHtCBGM
 EvnzKxTcWG2/lZ5OEIE6jqG7kjgGVt+SytyYRYMw7Zwi4JBUbRV5GZzxT5doXEaso4XIg2C3h2X
 mZEb3cF8B0tejJfVwvA==
X-Proofpoint-ORIG-GUID: UXBMdDUagoncOfZeY7DU-PAdilg-8Fan
X-Proofpoint-GUID: UXBMdDUagoncOfZeY7DU-PAdilg-8Fan
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190046

On 26-10-19 14:25:44, Dmitry Baryshkov wrote:
> The SM8150 HDK can be fitted with a display card carrying a Truly
> NT36850 WQHD dual-DSI panel. It uses the PM8150L WLED for the backlight
> and LCDB for the bias rails, and it is mutually exclusive with the
> on-board LT9611 HDMI bridge.
> 
> Only two of the three WLED strings are connected on the card: the
> backlight stays dark and the boost runs into the overvoltage limit if
> only the third string is driven.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
