Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421613;
	b=UXuJjCh+RBp59Wk2Xq3kRiA7KgkeK3Lgkoxut6sIShKPUh+AlI5lc2dtKN9bvLpAOGIO
	 YmsgRYh2SHkfnXZyvN4FLISt4JM7lZ59swlSWSjsTAsG5N+Qd1pvAf1bMuKgDqHDw2la/
	 foGN6dZrD4Sxi66DQ1MFsEBK6UVgQLJsgK4BD0xQ07qoKLeo7on4pMAiZlYSe3S7e4sL5
	 blXDGJE5vrJbyNh14Q08GbOQQ/wGE8pzl8VTa1a86DREXJyZTvC9GBfaOwMzNZzpksqbm
	 8cCJyAtVyTq7W6L9bsiRRLm8OGy56IHcQJ21f8I6aAsG7H44VqAs6u/zCpcf1c87z3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421613;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
	b=dNtaQUmtHLT83p9VPRJyl3yyim5cSWmuF0kvMfpoq9c3IkiHvZsxZ9M9Td6WugAKFaP0
	 an8tWYTyWIMfG4+qxIsWKKfrWqEK20Iw+Wql/RNuXHsId5YBhzb7lmvylnZsJfLnFsaUk
	 jXsM4XIsUU7QbXEAYzATs1Zu1N1GIfCQtd6NZqY795WbXC1qO6aQP9EIGIMN0V5YQ+Ctl
	 01r83fs3zTtRM2D9Nn7Itwb3ofQ5OIgjwqMbUSyvO8kPB1cyxljluTqO7lbp/hHAM45YS
	 2AibXILb2WNxdQz4W8grrkQoLCoa4VAz2wDOfRcJlveatYd0NpuCRnqEwjA8+AuEN9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="P0yGY/me";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxfPKxBi;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3264E606C144
	for <mfd.lists.linux.dev@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0yGY/me;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxfPKxBi
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B9C4AA01E
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421613; cv=none; b=Mtu3+f0REPnU9CEH1pyCwkv2DcqH/Ps168VXqqVj7q4i4dcixGCqgQASFKCbw3qa2VXeSdh91H8Z47ZYEDbh08L4HQ5TWJMH/0y5EC5x5EfDvQixWJDWcwZP/3rF4CMbjxKblj90rWW8XWwyiVBYgnOH0uk60/Wa+mVeyPD6Ow8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421613; c=relaxed/simple;
	bh=8QzhEza4cmQmxyVPqaeJPOjfbUX18+JD1Hl1uHqCQBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NcbmPWD0eBU2Ue74j+9Y9J+IORE+cJgBdlQzMAovvP3SyHcBFbz7GWJLjYpAysvBi26NAmBYt3bpma3/kM6jWxPDKzovoSLLSreJZfDuMfmPT5atmCSPbHTl9NzUYnV78bibAfQbUky38RC3/FGbPqNA6ebHLCmyFBQblLJ95LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0yGY/me; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YxfPKxBi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0RJJ2925867
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=; b=P0yGY/meToCkfXMD
	ERJxZldNG/3CN4TYtWvURt+Nj3E71DWN67WF+qoqtKV9jmDIwtOuGSTXHsNVIXZC
	R73aUpsQJPaS6FKVK1j75E1T4zr4eG6zOWWl3KpIIcA8+sZrdeHX7w67lreawtvx
	gAtR3+GpkMogP9gnAmYj7LKxD3GIyQ27V5V4etMPOpG3WC5hHsiZQfwcSfFJpm2S
	u8gdHYJ6vToL1QZirfusd6YW7L1Ap3zydnHU2M38mY9DGhFE+wKnOQpgr+5up8Mf
	tbQ2FtusEFlkKqRY4bXw2toI3frV+js12w+cqlk3bZrZ9DFKjeMzbsMNPigx4tRp
	yRsswg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w1bbda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:53:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so39059785a.1
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 07:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421610; x=1793026410; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
        b=YxfPKxBishHey+nzBXV8qMC3qm8e78ZTnnxpfxwBwonYq7us17WcgvZJz9Bpl44gNT
         4G1CHtfbKhOxbEmaFdFOkaphdFV8YVom+1wEURWXpvlW+a3IjG7KIdpN+K+N+ne5ZFup
         DgLpcsmXq2QOqaBbyhCJt0uwSnTvqMC4Br0hn2az+X4h6vfhnNhfE0J6RCyIF57kUp1G
         TEdxE921bssL8Fn9K7vdA673kWdzb7WlNUEDWaGhETFZyBDs2qZpxKw1lbwCfU/5XaaC
         FG9gLHccOMIGsnKIF0wPSlA1RgsCbChbGq5NO6761ChWaZxtPqGCXwgPklGm/5EpQhMd
         +IrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421610; x=1793026410;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
        b=Ri+lL0D/w2vZzhZFeuFmvqKQIOrLmHJjfN+KEEZaHkM+cm5DZK54/9MMV0ozETwzhV
         AjZ6DawXt+bP8hdJhQ1tG6mt7G2PYF1UhDH+dqHF6jAPHdAwCkQdw0p0XuT9I7EM9p5L
         IBxku3Y58YD3h+z0wzIpLIAJS3tYjbuICsj2dE2kEHmobCvDmw23d4CCHc8UdPaoQpYh
         XuG1TR/BWwM3PWCOXjSfttytWfibe9g8ue05s9W0wprp/FSSU9Rr2N2fFwDPMJqTl5x2
         /dlslopC1M7FzTsbWYLU0KjwBXTkKjChqvgvp9VI5PUTYzYZjDopSBBJcKrkymouJxph
         hS7A==
X-Forwarded-Encrypted: i=1; AKwUvBz/JPPZtf+V1G7EMYo+OzZkBl/6K4jSbdMzlg+RARGLlVudl6qr0CKHxGNxoM6nVYP9U8E=@lists.linux.dev
X-Gm-Message-State: AFq9FYIAwd1uDdHEhTAne5QVtwWcvRTl6DXIWAzcuVVzBojC61B3HBTl
	w9a5u0NRZoCJ8ayU7zZoR37vLWonr+vD0pbVFxT9yPAqXk3tL8hj2TqhxF951cSNs2rzuiV1sHG
	CGMfFMnVhuLmFErwCwKv0/8XFPRDt8WOuFjJSdjmM88IZvNhVery/wYU=
X-Gm-Gg: AYBFou0DbmOx8iY05rkCWWOfZg/efXXdwndW1qDeLU8I2/8sG5wl1Jt9Dzo9ZW8O0f3
	/npEU+PlZNSGJ5CXq+06O1ibauxld9YRMvleYD2tQtbvlyC1ei3TcBvqJR8CFksDP80aAkQF5qo
	imXvgnNM/4Y7C3Vmv7X632UiRcWqn8skN4mzTG0nXmlCYuzrrjWs7z4K3AT6Kd/PnO6yLZ5nGvk
	MyGzI0RfGwwJ6PsJ8UDONEpQ5mbLVsrzFtCNfgc5IMYKK/S1i9+/VocxLJVv4fYdcfhXByBCNdd
	Pq4z2+sDM+6lCLANbhqgX8gGgTdTZi0M6j31pLK4sxmtWa77JYP9Asowf8zt1PrvpqEIxpu/nN3
	CEeC4xGoYPKSlolHvmTwgWg==
X-Received: by 2002:a05:620a:6192:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f29e50356mr1470500185a.6.1792421610263;
        Mon, 19 Oct 2026 07:53:30 -0700 (PDT)
X-Received: by 2002:a05:620a:6192:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f29e50356mr1470495285a.6.1792421609756;
        Mon, 19 Oct 2026 07:53:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb2f64sm365653366b.77.2026.10.19.07.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:28 -0700 (PDT)
Message-ID: <2d491ab1-b7b3-42db-8302-5adf4d1a48fa@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:26 +0200
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
Subject: Re: [PATCH v4 10/12] arm64: dts: qcom: pmih0108-kaanapali: Enable BCL
 sensor node
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
 <20261005-qcom-bcl-hwmon-v4-10-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-10-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXxz7NtdEOL7S1
 l6gT5N+VYF1g8jj+Z60eIyN5JOkTdNX3HkmD8hZbrhq0SP5gKuWxfUVP6YCCUmZABbbYWwFznR4
 E8lZvmD1B03VbjvKjJ/q2k9zjlpSF04=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad62eea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_ybYkvnUm3iZRZ9voNMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXwcAnN4bL0aya
 9DAwd8b3sdoqqyjWGB09hrfZodEB0rzv5ECVHTQEMnB+PCD/zro6Ai15sJn08gv21xWevypYnQB
 5YGkQrzb+8R9fTnWR18MZOVV54tx6MPPCfAG6Te7KsSiclLsKtspkwi5E4IyyE46aWN+eGw8zeB
 Q2aCw7lZE6mEnwSfpzcZfIgKP4hcG7ofGa9CD5ZDDe3ntpDyWGDi/oAYslmvvK3vvvS9/cLQCUt
 bZa+YB5et9eeQDyvt+GfHfVsgWbpkjdbwEDoZrv2bMWJhkPYecU3EJgm+m3L5WlS3YwbK32LYp+
 Ia9psBBGDKSgOGp4AGiX/Yhn6baF7yZRkqCoSLODbmmbsUpG2QZV3T5Oqc2GS0OHuDb6JgrDHrm
 jnqpFfSotpfthRZHc6QncOiyL2Dbt0hPlgELe96d0XwPl+aeYAEhG3jLK8+fcGqG3bm+drCurEe
 O7pyESIN0X3qrh3m4TQ==
X-Proofpoint-ORIG-GUID: R_hF4f_i3R0pHwgB5I_KEAD_vg5z7oWJ
X-Proofpoint-GUID: R_hF4f_i3R0pHwgB5I_KEAD_vg5z7oWJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
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
