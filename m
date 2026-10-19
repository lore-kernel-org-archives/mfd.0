Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218974E5341
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410452; cv=none; b=B1p44/rIoNTbYdRFbUgDWJLXIeacifEIavosk3lGOUTrfozRFJwgTfLzpInF5iFhdM0ApuqSqKBAQeDfJMFtHhqL0rMJACnhbrz2/aCde1GNcZA2vh/8zu11Jkw9kYd9cfCI1cFq0nzLHGUZYNjlOT5wKAzQqBtMjPK6UvUSmMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410452; c=relaxed/simple;
	bh=gOZDEHU3naOYoLL7egqr62uzt91zc5Wleb/4QbrTMNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D7JyubdcmsRHYcPdGJdS34edMvVdN4NFa7O6kP//kOHVXAkvSuG7NqS29H9mnvsP11+UNMHlVA+P2NT+MgU9nhAnzuWSXm8rPqEwMo+7CdxrFfdQ1wr8rYmDrlX16KSANzb3WfzZGv6NlVmhKlRjojjCPzHE0Jxqm/DqVG6j/cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fds1VCWq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lc/eNdwP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fds1VCWq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lc/eNdwP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OrHW1665571
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mSnBA2Qem/ruoTNLx5exIMDknp1eEWtUaIxZflIr15I=; b=fds1VCWq9ZZiUZoA
	34xGZhm7jCAyiKBN4O9xLOvroe9NE+XfBXSaQtlVn7+U+h7ZGkyDxPR0W4CwTlL0
	7BrYcJ5xwrb//skXLb+ynXhly30joO1fh8LdGd3TFO2hpX4ycpFsROyN6zrJeXd+
	fzpiusdg+iBzjJSk3sLr1IC5Rpcde21f31a5AOG5ahhHvqp529wlY/EdXgbGRAnw
	u4BOdKijcEEbpWBwXsy48L2JCPitLnBA5ZQmfT/jjEWy2yYN9n0e2z0R+SgQCvsR
	z4i8/3t73LZ3NCx9tBEwCD012L29DaHnbCZ1UkNOhkxAi38fIe/uJymYzdjiZKtD
	5FoL6w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n0w85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:47:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e629c7b16so35301885a.1
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 04:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792410449; x=1793015249; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSnBA2Qem/ruoTNLx5exIMDknp1eEWtUaIxZflIr15I=;
        b=Lc/eNdwPpw9wpGWtJoFFMQciMLnAdN4uInSshbmwV0pI2jbeH/g7O1uX4cqYZJ8sLv
         pFq3I7yiSRLU89eYoEcGH3Uygf5ZCX5Ai4vSQGslgRHLzDzG/FY5oJmtxvzB7QeGs/M+
         0bV7XT/eQlNY6CoQj85UdH1eSFEhauSC3KTtuznxhjqmnAQEHY9kF7GM5RuDulVkbEZH
         BCl4aBOrKVi2q/RcvFBTQqK48r8LhTTF69sS4DS/Qydv3a9zatMJo3fOWV/5xeO/tXY9
         gpYRxZDFMiGHjZjtSuxJpmFroxxVI3ZrL7ED8bSVCaFYT71La5AgQdC6peYySfIDQ+iW
         DvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410449; x=1793015249;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSnBA2Qem/ruoTNLx5exIMDknp1eEWtUaIxZflIr15I=;
        b=KKbKKRP45kHywWsJ6EFGWCZfKFmLeQs0whlHTUfmoOlYV26SCKUY+M5Wc9rJGImeRv
         wMEKcHlas9/0rMN0GJ5T/B5QmA/QktopEmazXX45Z+wb0SGidgxlO1V39SAzRe3iQMlV
         gDIrDRvR4EKHlWrE8xY/LL0WvmyIdR4lxbtE8FVR8LGrzTell5NmhXraIqI3TH+xcS2f
         turvR9MNt78L9bsYutlGRPvd34z8P3nmgeG5vDUQy0X9aQ6f9yRRtJyqU7xmyXET8vw4
         3Uj7kt6gxyISBYp0Oe/bRA9RS43O4YmDvuLI5Ea5aEL8ItCaVMW+Upqh+7gGq+FKdxy6
         atjA==
X-Forwarded-Encrypted: i=1; AKwUvBy/NK2LRkjvRnICgiwD1bTm2pBqXLfIr42Xct8oayhgVGEEZdogjD81/RtKo0rMkBTgKcA=@lists.linux.dev
X-Gm-Message-State: AFq9FYLsQVAd3YVHnzrI4tXT1wfgdTpYZHKDqh3eju0sTdY6qDNi/Nji
	VC2I910i3YuBqQPB7V/F+X1P7TofczvPnVygykr/UEqtPkPIuK54r5Iod/VQ60rGCxbcPS95ziu
	gPvsRTdOGwbCydJoAYnVDphsNA4/of3S6QIVzWl6utR3xpYu1HwNSsBA=
X-Gm-Gg: AYBFou3ffTJraR6kU+Zg5PMhvR3+9qGnyLVQd9s1Jirgvi8cqTP4+lE5CyYDgYs3qmA
	mymz4lHxqXyBg1+xaUsxU0MlAgBw9PxqNGumpH/Iw/qcx5bs2NAwsGGEKVWDnI7BoQEIRaErAWV
	8K6NOU9d5sD7sqguUwBHqLoUe1y4ilkpRvk31XlXsrm/wCfHjxsPMV/iZpc0TYfj+ZP9g12j/ck
	ThXnMgxm9FlnKfIBY/TxfSqsSllItVqb7ugTv59qcUjwg8unGvN0LOXbcfarGNGLwHHnaAZgOe7
	3Yhu21yrh+qBDa00sJV8WQvsb0BR6I5AcuEQM5xZ+uSbdESeThLsiDmvEpb087pv7/LSyAd5pNj
	6PqNfTfcwnlCFuNbjzUU15g==
X-Received: by 2002:a05:620a:701c:b0:939:8148:1e3d with SMTP id af79cd13be357-93f29bbec19mr1384647385a.2.1792410449128;
        Mon, 19 Oct 2026 04:47:29 -0700 (PDT)
X-Received: by 2002:a05:620a:701c:b0:939:8148:1e3d with SMTP id af79cd13be357-93f29bbec19mr1384644385a.2.1792410448717;
        Mon, 19 Oct 2026 04:47:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bde60sm338607366b.60.2026.10.19.04.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:47:27 -0700 (PDT)
Message-ID: <fda445f3-8d61-42e4-bc49-c4d5715254cf@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:47:24 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: sm8150-hdk: add display card
 overlay
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-8-86c05068efc5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-sm8150-display-card-v2-8-86c05068efc5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfXy3f84NwDjRz2
 MqAXDkoPae70cdwE54hSbHYl5ndNuanStqBoc62gfGP6xft4FWWOtpZ/uW2DntTRxY8nswBqlIr
 z77V53a5PITvN3TKin+ftHOuED1O2qA=
X-Proofpoint-ORIG-GUID: XDmS3QwwqZ6rmk8i5Gk-0lPsnCSnUKME
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX9HRj3EUrISoB
 CxodaIFOnr/FfEsbBfC8t8+56G9+7UGkDsZQF7TLCDfrnnL9RpZeZ5YtZnOwxlYK3jWvVJHDxUu
 6KDOzD+ZjqIY7RmbtIvaRh/M8xiGVeI0T+O8fud50tXHKIopxWn6G80WxUGR4bEbW5othR0EP/P
 skWxCI2Q5ieizBxM+RMGMfiHwoHivWi6j+NfaAdN6p5Hhpvm7XhUZwYXV7CE7VZTmnt1izVIEU+
 0SwP3p9VsOKZmRybi5XYNGLW7NUQW/hsleEV4tOCyS4ijd0Zyz9Uj/0g4Psg585OTji/3XKJKJE
 h19hEseeNXv4ElVWRkFclv6vN2aYixaDTKeFu8DPZt/ERnHZqG/znA5bZjJfo5HDLEzyO/oc6zn
 WI1DbQKPboqNNP2i8CzCZLzwxTiBI7XEMgcEqRCX9v1FZXxUgJLti+05FAcOU9Ki7LpPypqm4q1
 JoR5HnRd43+ZkPmct+w==
X-Proofpoint-GUID: XDmS3QwwqZ6rmk8i5Gk-0lPsnCSnUKME
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad60352 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=oyhz4BWCyAMKXFkMYugA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190046

On 10/19/26 1:25 PM, Dmitry Baryshkov wrote:
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
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
