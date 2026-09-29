Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D933D9DB9
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687895; cv=none; b=LRJCtlJexlWEyHKcu24LPuZu2y/SauYpA2KaAQZ7ww55Sa0MGsT9GGfjO2e8spIQTS/RSQuiwMMCFVML1kpca79PFb5NJAqVqmMeUTsD4ybERWebhrqOMKR3MOVFgIQgdR235mBXQ83AQMKl9hirxjND09N6Vp4nWTRT2JZWDZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687895; c=relaxed/simple;
	bh=zxlynqi9fA8FlivDnTAJLSnkFbzFLM6PTRJzA0vvrQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMSyESK0+htY0xjcfMhPwgSro3qGPaVu+cp78pgfIvC0LETEIp/jLmvJQcqsUazHRznUUfhb1ff6FmQZMam+xwQ6d7fGLSCSpl3DImoLStr7qzhOkXuht9DPbycLKaMSS5XnvnjmUFiMWvCeX1TZZn/uXFLYDRzLdJmFyN3xvJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KMil+mGs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JiueeGfe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KMil+mGs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JiueeGfe"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqeDn611496
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7iPBVhcUH178RCfdDLu69SKN
	FsRS6mvhRrQFeu8efrw=; b=KMil+mGseY6xEm7eHWWv6S2XW+SZ5ztlbecdyUKU
	UaOCljx9hInVasq+uOM/H+7U0aXW484crJWmizv8LtQFXd27Qt8JLJuB4wdE5bLW
	Kh1irypBIOpRPddBIkFN8JdUap/kv3c25e/B9cScsM/6ofUt9W9vE+fzWi8NejFF
	rIBex24AlKsDV8prLcUQp6i24ItSc7pewZjRA8WXagr4W43rFnYo248m6boV5/dZ
	ppFmD68bqcga/3icp9430da7AkO9DKvXGdyFWiSgx1iZ7PpDLimil3hpqPqqB3VC
	b/+qDSO2rlXnfoLZvgH4wsVs1RpO0iq3sa9g87B/0kQ8dQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4u826-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:18:12 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-986abf8610bso332120241.2
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 06:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687891; x=1791292691; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7iPBVhcUH178RCfdDLu69SKNFsRS6mvhRrQFeu8efrw=;
        b=JiueeGfec6s+b9yWoo+QTguYQ+Wn/d2Gifs5zVpWEUWCviw5HCnxng1H1FHAFmgENs
         NUkdu6gcHmop0+PynnXDUcwBAjPVzL0zhtazixtDHHjF9VWknCA/BKefWBcmb0u+V0RJ
         5Hz9TQt13QRvvzdDP2hXgHj6KVU/Xv6d4zGEbIrmbAGg7kIKCyMmZs1HSuaU4YvvhRfK
         E6Wgqowgj+xBG+LvRKzx4eRomN/QyERlMw6AOhWoiooln3SAKW2lwTLVo2hZ/RKQcS21
         71m3AXk+GL8lEop+63JZk3/lazpOeH3fKVMKFbO4QJu0HSEcgF/WaFS1rcKvCU4w//IZ
         uGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687891; x=1791292691;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7iPBVhcUH178RCfdDLu69SKNFsRS6mvhRrQFeu8efrw=;
        b=tcr+2WEvoH2c6MuheUnkCxK799A0U27kXA3I7/xh6478RZANAYGZArpszSXzLG+c2Z
         Dk1ZqvniKmhj+nVd8CWSwZJEVEf3qjYsxalsw/7qoJrIj9/mr83RG+3Ao+VGMrDTFETH
         XyrzzTMuC64uhu/Vopx8xfmvfaBOq8AWVRK2gQKCPj8VDfBMdShh36OQgHwak9C3Fprg
         CBsRsAn2fAq0MRPjWx7SrhQA3t56ubjLeODs0y301XDTcz/tEXy8+nhO7hEo0BkD41Dy
         kntT03/yTFPhA7BgpadUqEqyzA97lGnQ6lnqMXmk8d46/h5b0Wnu+tUrGEiGMQUsQksa
         86zA==
X-Forwarded-Encrypted: i=1; AKwUvBwIjb2pzpez00gQR3MKnuW1NQrjDY7qxDhneUFqKeWFUp3CG18Wh+Zjl9DGSAEIovje5lY=@lists.linux.dev
X-Gm-Message-State: AFq9FYIKT2mJw/opUdSGg6mR+9AUqAKJPv5lKHuD0v8xNy9+cueAuCm4
	T7ANV4M2Adn5OBXsKLjs+MOFy5sWsCvlOgz9oL3mJqIjav+faIe39xDxR98W8yF9WTYC7FWrpmv
	j7ktNJq4XaD97I35j+HK44JPz/l1W02Gxt5y7FNZgNDvlhd4qcPrSQBA=
X-Gm-Gg: AYBFou3SbJnjrS85/jv2Qf2lBWDuw0Epm5gjh0knlfVLgkbgN43JnjiTAKsN+nzskIE
	h2fkijG+FcJ+gv71A6b4TiR7PB2JoPFNQjaR373CkVGPuqKfzdGxBA+TzhW9K7Z1Rnf4/wOrQMt
	KtNbL1UY8sH/jVKRzh1IE4Tw2jEpjYaXUhWTT3Rgyo7MoPSXMMqWif+Rsf2f162rWzLPff7fqPl
	PQWRTANcw9dYH6sR+IQGPikcMAYJZx0hZuKz12fJJZb/9WC2YBWTPzPMChbw/fYQzzoYLz0Qntc
	DC8d1c0jvkDh+WVhLVYvYhZNDDbWsKTKaSzdEkARw79S9DAtZtsMXDd6PHcV2HeUUJk9yQlUSQB
	jYje7XWJIp1SFgrk=
X-Received: by 2002:a05:6102:512b:b0:7b2:7aac:8ccb with SMTP id ada2fe7eead31-7b27aac8dc1mr2849927137.17.1790687890908;
        Tue, 29 Sep 2026 06:18:10 -0700 (PDT)
X-Received: by 2002:a05:6102:512b:b0:7b2:7aac:8ccb with SMTP id ada2fe7eead31-7b27aac8dc1mr2849905137.17.1790687890247;
        Tue, 29 Sep 2026 06:18:10 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfb479asm77089755e9.15.2026.09.29.06.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:18:09 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:18:07 +0300
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
Subject: Re: [PATCH v3 05/12] arm64: dts: qcom: pm7550-eliza: Enable BCL
 sensor node
Message-ID: <xttngc5acpc4bj626ekvbjcdwswnh4wjp6yiej6kbwxz7cdcv2@cj7gxywhskep>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-5-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-5-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXzljzoPAUgl0Q
 yMT3cAmoVArbkp7WWuPtKNnqIO/HdeBlw/O7gYolLYZ93FuLucT6qNU3ROT2hFj2xO7YskiR+gQ
 WKjytjWI9epEWD3i98h8LrLjeJiPeJ4=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abbba94 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GBzGvGGi_yB6IOxyoawA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX3bMSeHAfGBlW
 //ZcTd2/g6lZOBtagfR9ZWuVoVU0mH/Gr9NG8kIM4DEFmMk8uoKGxwuGKLXt3VH6KPbNStED+iY
 NGxGOgBB1gwqqr9m/H5gNTAtyrhkKTp61Gwai+wcpMF+aMlBIFm4KpfJC5jLltdcUWPlY7ugIMA
 /np1xLIns86ERezILmWPEPERxk3FFm+bY6Z2XfN+z/FBkd6EwpctHq8YLr2BuwrfQJGEQcVWmBh
 3JFOPGptymDwxOaD7baAzjyYGL0diE4qR5JnIcqhJ9tMgy7h3us5xlG4Ux0izRKUXX+vJxCrnXe
 jsHy+Kpt43EWLBsN/l85a4TaieU8zdxzke4UlDdBltfk1NzkuznBq92MfxudS+6vKi1nwF7lo8b
 WbzUVvtM3XpR2rCmtVjQhP5VUr1wiRrLWbEronzmRw6/j5Y6EAq4PGqf7yZNYK4ga5pKpLjJ3jj
 WZUuSRv2Gh3IifeG0oQ==
X-Proofpoint-GUID: ETP5sH618YoOh3ry80hAGdKm7zEN7gLN
X-Proofpoint-ORIG-GUID: ETP5sH618YoOh3ry80hAGdKm7zEN7gLN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

On 26-09-29 18:39:37, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for
> pm7550-eliza. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
