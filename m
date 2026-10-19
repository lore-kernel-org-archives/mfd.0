Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5464D957D
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 10:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406942; cv=none; b=UoWu3Kptoc/5QRVU3DQVeqhmdhx1imiC4+glQLSfvuKNDfj6Pq+xqKShXFhxUg/ynQt6QBBQSVpx1MSVZ9CH3YXQuKUrlIXGN6y0kxEEOhbM/afLsQd5Q8hGXtXOAMa/39GvsXmoYiB7OPpJ4F7+h4q7QjndggdLOFDiA37GPAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406942; c=relaxed/simple;
	bh=7CJ1vwF/ABQg3/G0LKwIOetPBmMUxmnh4sqqhvOCoFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YI+KoLy1bRsWh5A9G+cJ/hrgAHbydq0i6pppsXX/xFPEFB2XFO5ej1BWHKIpXA2ob5D3eb86hoB5gwrsoWoj/JNp9SQffYhDTFYo9pS3SqIK2WUHAc7dl36dwOiiqyETYiX9TIg+GzkWRXmYj7kMFuKab3I5+L9+gvep4ACLs30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P5dBz8xo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XQdbrTBN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5dBz8xo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XQdbrTBN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OrJg2234314
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 10:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mT9pGEhM9TkqrI8yQKVArxrG
	5zf0RJAxHkhCNo1DWs4=; b=P5dBz8xoR8WUxR52X9YxaQYtq++PKHRxlqwDK2Dy
	3vsR48sPuO1nAfhnx4qSWDNzmYyZU6diBohgUqxRgJjm6CcclvKyJinHGswJkFx3
	uKwgSve1CyXmCrRKrmH41ur9AJG7f5b0vIpvpXFE52uOU0VnbA8vchXkbust52kD
	OWpqrYBUUDhQKo9GrZa3XVMgrfskbRBiBpTYf/+HgoYdpf9WA4P9yQnoA/QPY6Yx
	GJchCZT9cVREOxiVxq12Rqdbrx36H2O149PnM7arxVJ+LsMnwYPx+WcT2/+Hz2HI
	xgMC9Re/CC95q4CwDraDyOkevfl6RMbnBs9ZKxWgMl2/VQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3x8py3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 10:48:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1de6d5c3so487734985a.3
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 03:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792406936; x=1793011736; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mT9pGEhM9TkqrI8yQKVArxrG5zf0RJAxHkhCNo1DWs4=;
        b=XQdbrTBNdOBaby1Rm6gQc5LSvr4C0S4yHDkZ9zO/mHkdGj6ROVNPFdfZnktel5idHI
         uZuPJ3x7teQGB/WN16z1zyJthePFj/NhiA7zJpnG0634VV+X9+in1KkV4ZxESwS1LM59
         v5KQLMxbXx+LzJYFJ+Y5uDzDHGObcUAceiFbaZJ29W0xsLrB0RWHP9rJmUheNrr2UvuZ
         H66Xq/SceyQOn44RcC8ATbaoUrHeawi97hwJoq+EBTpfwXWW+XOGLzzI/O+0jtLbQuYb
         /FoYuQapSKP2PD4ndMWzKc7ifVV2t+EvkEvt/YynXa8wQom+r/XBACy34dv0VX+5lfYT
         UmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792406936; x=1793011736;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mT9pGEhM9TkqrI8yQKVArxrG5zf0RJAxHkhCNo1DWs4=;
        b=VP0mQbQPRydRCL5Gz8VJx4duxs53Rd3Mr4qIxVVfM0bhdS5fCzkf010Tpj6SxFb2qZ
         l4o59Wf5Ub9GCE0rh/s7u90dPOlqQmr0N04/1aCNGKgtzyYXD4lR2rbt02Mw1ZbifsqL
         p5qHD3Nsc8M7a2/jGFD56F4R1NuwNNziv9rU9ds37r82y74h3m+wIlLoQH1yFZ2NdjpN
         E4eiCG04Wfv2T4vuCM9PGGAwQIWjUYlUZmPiTEv1oLXVv5/A5Y0zp4PW/PxCPZG8G8fO
         rUAXeWWlPBIyS6id9TJShmqU5be9sh9UviG3srAsV6xKwQB64RrtM48CJA9kAO2wz7G7
         7dzw==
X-Forwarded-Encrypted: i=1; AKwUvBxr1USdtY1g7hbb8gwRV04nn442kdIP5DxgWG6f0acjl38VlkwmGIpV72BOP1KgFpi1ec4=@lists.linux.dev
X-Gm-Message-State: AFq9FYI9mW+ctHcD4hrfwggPO6LQGNH3sDALgzxBVdQTarllx+KS9OYS
	uLEC11c+b64pg2wLvh1AkAXKPbZTlN57NQxc09c/F1Q5jFDitb8dN0IB00KZgtpHNG8Alq5OmF3
	cJcqwKPZcoeI0m+xxbE6xFndJLiNietdkSk3FuciF1bDqjbJiwHpp1PE=
X-Gm-Gg: AYBFou2pr6TcqRbIqTLbS0f7n0h/I84NcFvg8CxFtcM/YHSKR/p9FXAbMB8QYwJ0d5v
	9lIo9GWg5+MvHpcUGHiGgHql/rlUtoYakQ0d1ng++sn6WLoTLceLZM2yh7GC5Oc9pKJ1ahkzUD+
	JftPveiuTQ/MGqdSW6WBxxChXf3VVy72egH9oTHWJjBGOcx87B5YhCs692z1Hv8WWmja6HFNTg/
	UKoyZRZ2d7P+VY2pZQd7T2VrV3J19t5xA44M019oPqGrCAijT3zasJDnh8fAym2HMTfTj8LqLXX
	CGTIHr21i/okGsg1PdkSmB2UNRSjI8Q7138OCxoTrxw8cXtR54xOKXfMJ+RjF8/smBM0AKE7qt7
	EGkrgYfIOLH9+Puu0r7NmLlGregJdOk2ZSk4ma0sZhIo1TKWFjvH9W9+wwh1tAdB7p7erVRZVIl
	Vd2ljY52T+vhjz
X-Received: by 2002:a05:620a:2609:b0:93f:2938:48ba with SMTP id af79cd13be357-93f29d9616dmr1189024085a.55.1792406935906;
        Mon, 19 Oct 2026 03:48:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2609:b0:93f:2938:48ba with SMTP id af79cd13be357-93f29d9616dmr1189020585a.55.1792406935510;
        Mon, 19 Oct 2026 03:48:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a434a7esm1888152e87.37.2026.10.19.03.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:48:54 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:48:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
Subject: Re: [PATCH 8/9] arm64: dts: qcom: sm8150-hdk: fix FSA4480 address
Message-ID: <cteiu5owhinqz53oxcfywioew3kh62c2jbcej2etobfx7awabp@regtmdoqc34b>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-8-5c14928cef29@oss.qualcomm.com>
 <ddbb547a-f59f-4ad2-8c99-4436bdae84c7@oss.qualcomm.com>
 <36e8a372-3a4b-4466-831a-2445313dae51@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36e8a372-3a4b-4466-831a-2445313dae51@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: wdnbThxm7VYp1NZA9xUAzhdihza4RZuQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MiBTYWx0ZWRfX8/eB5uA23GP4
 id2RWGyojjjPUpBE3iuw3yu3DQ2rMu+4BGANs+ydsXYnBgCNcdlncCXyVQ6KOUZWpHNki6WdiUe
 byb9iRJH6Qe1rxoTleF13JBSS1b9gaI=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad5f599 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ciNfSeS1p6VPI-OA_NsA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: wdnbThxm7VYp1NZA9xUAzhdihza4RZuQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MiBTYWx0ZWRfX766Fh66etPmv
 jolkFTfTdSoKj+HlcRfUvXIuiGstyhx7R/SvqfETrBaegjrl1Psd+Mw/puxk0o8Hoh4W7T0pYJY
 w+MrxjKsqXDe7rN/g37lUtb27Q/LVnjCfhBKoHWpk777565GjlTGdKdD74IOuf1vlh0bXQyIKo5
 R43yDggq6m/x+HpCtm83Xz79W9disILWJJ0gZ+KzQMrLREC2D70igf+fWWhbBcOvEdE9doSLlP9
 iLQN03IVKvaW/xJ4dJVKXrAkkZeb0WAujSJpBYiScMJx3ZTmRW0d9VWkj/oSJHrkNQLSVwprdL0
 W8GyFrfu5Psqj/sbfmA57dAIYFWxvUNmp38Z5KOX0yu2eh35zcGcs/gJnsBVd4ETkAD8qe7izVM
 h8eHPoYCKevJcjSlYQP2Hm67Bmf6NXazlw9bjWBFCGMw2nOIdpiKI+0sB4qzPoIiXvn3va3pgGw
 HmtZtf3VsbV55fSwQFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190042

On Thu, Oct 15, 2026 at 11:11:08AM +0200, Konrad Dybcio wrote:
> On 10/15/26 11:10 AM, Konrad Dybcio wrote:
> > On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
> >> The FSA4480 on the SM8150 HDK responds at 0x43 rather than 0x42. With
> >> the wrong address the mux driver fails to probe, the Type-C controller
> >> and the DisplayPort controller keep waiting for it and the display
> >> subsystem never binds.
> >>
> >> Fixes: ba712fd55c7b ("arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode")
> >> Assisted-by: LLM
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> ---
> > 
> > Hm, there's an ADDR pin on the FSA. I wonder if the previous guy had
> > an earlier revision of the board which routed that differently or
> > something.
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> oh wait.. the previous guy (author of the Fixes commit is you.. :D

Yes...

-- 
With best wishes
Dmitry
