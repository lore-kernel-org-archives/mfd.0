Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28F34DD3CD
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410451; cv=none; b=jLhYgIrDkDFeQRKFeHuzYcfpcFlScByAkRduTPmTDZ6Fji4Y+z2AUnXIAgZI+UXLiv6+M+Hc/tXFqQQOGDcdw3heoiZMfSc41roluswiQ+zjHsSIQA60G1Tf+rtjApX+Mn9B9Jh8QPvzJEQwiKufMG3haWzpKYIsZnEk1BmM30c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410451; c=relaxed/simple;
	bh=y0Ccx45xxLYWt9pp0bul/0px2ejfDCS85zdyec5AYdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrNPR8BK5/Y/pr6ulNrLIXA2CZQEaZogtxSevqZL2ElQqDAbHwKCG/C8/NCN68lykowO9apoP/fpk2O9QTauuRlL/6NjS5KzvcJSsSrmZn8gJaDk/73DxUWm5Z09o2VQzq/GnObBdCZAq3wUcgrE6s3JaoDZ2Zrz/nv5jLXhLYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XW/3WAht; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YVWdge0V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XW/3WAht";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YVWdge0V"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OmEr2234210
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DA19jX9AB0uHbCWwD9Zbkxsp
	a0JfxX+l+oTCDhGHnvg=; b=XW/3WAhtWkwvCLBXO/vlD0QZ6tpeQ3sN3MTurgTS
	OxtGoYo99+/xkRlscU80YeHr1FgogvIN4dd5HV/rt53OdWbEVSDqM3X4XbcG94fD
	gLYmZGjQu4xVzU4IEVSP9Sgss94Lre2m5cDmXuV4Vt3iz8/oq9leUu0DK/20x6tW
	Z9GvJfHnd43p27MVk/MD+s/hC7YyZyjyWLIMCHa2NKhW3y8jXGRmgE38X+vLPQim
	7/Y+9OqT4cprNevEwlJoMG2NXGmUbzC3DeditX1IbIvQVZ+vQysLMasPFFit1MOk
	ma0d6KgTKawpeQZyVjP7cVVFoIgtqWdZpkqE0gfRV0khtA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3x8wj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:47:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so464003285a.1
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 04:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792410444; x=1793015244; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DA19jX9AB0uHbCWwD9Zbkxspa0JfxX+l+oTCDhGHnvg=;
        b=YVWdge0VUjN4Na1kN+/s9ea4QZs/BWQYcPn8beQ88AaeZC0+Afhib6o5+AyyM/smiL
         n+ogkpTYyPeKGVU0UhY9yVLbujZ0OqcMXzVSWifgeMMHepj3gX+INIi1ouW3BWXTEUpT
         iRC4jgFdzE7IRPClvvJwi4EiXe7v7OUlSQ8X5ZVQ5T30LjqfWCZ6eeEznkqJ0ugtztnK
         KL/jqXJ+yWtutc++rR63sMTkckwM2zZmGV5qfmezfMCkW4pPTDWQZBs3kTnf10CrBbs2
         JkXFCcu/glssAg8oSBNa0WhRKvNxmieg1Phu5WkF4dcWJpU9iBPeOSQbhFuCIH5ZpOhC
         jObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410444; x=1793015244;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DA19jX9AB0uHbCWwD9Zbkxspa0JfxX+l+oTCDhGHnvg=;
        b=pPWdQlQzYjImgZfaRi77T7nFVCmYnE9cokNTp+7938At0qjxcsFpwQUvfm/JFfRhNy
         3a9vSjYUwOve7iZOdJqQW47va5LlUt2GUk7UHPg0NMEB+lrXfTM+occA20590JnfwMIs
         L8a0/jDUwtlaURHfAHWgT5KdC2OZ7NwbDEkrkfaJeRfv6i2x0ZzP2aJCKR3AxLkWIS83
         wYwk1HXO8Q8lrF6/MaAWbG0w9/2Bm3p5BVgj+veN2TJlPvXbJd6sUj3WxOLYAhts9bak
         lZNX8L4pFz6i3409xTCPv5+xYuaUGuFTnc5a40leEZ7grHnJQqCvqDl+B1mc+/k54LjB
         6k6Q==
X-Forwarded-Encrypted: i=1; AKwUvByelVliAreTfB6z9zBnXhswNQWzEukHw6hMrF7bi81Yn/tSvQUC4kTi5nZWs1zP7UfXGOo=@lists.linux.dev
X-Gm-Message-State: AFq9FYJdFmNXXNHLAr+RJSYUmgxfpU+r3U1e7QCjauVBh8d3Tncye5rr
	jv/Cf646NNAMjvArhTDIxf9rvczjuDTjr80Gpr6ig2Wf0po+vXzgpExHj+LfFVeeUKKTN9D/WV8
	pO8610oFlgLA+WhG/F1NPsn+C7d/fxJXvfpVVbmYKKl4cTGDtUbVBFuY=
X-Gm-Gg: AYBFou3L1Aq27NtuhecVNsJ8q8mgEufhyQDTusmWnsMRqwejsrwQgLRlS7K59/zyadn
	IFp76auvlXnO2e1i0KKj0TtGkDZgRpnJ47ai6V6mO27va5R+mNB8ZfNL8wrwmTSLTFT9+W7lDkJ
	lv/32epA5GctUrHOOCvp/N4fmJkNMkEGfwHB7bf+GeYyds/eMoP1iNQJYxX5n/RfXH8nteQHJq+
	EeR1MYONktctAIkIlfreh0L9p1f2+J2pr3jSU4WPjYTHLs+DyExRCEAstY34dEvhNAKf6QSvUl/
	gdpA6cweL2Biy3M4B5/rSmQvpPkVD1ryQlWaOkOMkkrgaQ4N8KajS6sihrumcRFZU0YfraETSjg
	pOOHMis7OSmmTTo/p
X-Received: by 2002:a05:620a:4042:b0:93f:735:6c83 with SMTP id af79cd13be357-93f29da63b5mr1143958085a.56.1792410443664;
        Mon, 19 Oct 2026 04:47:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4042:b0:93f:735:6c83 with SMTP id af79cd13be357-93f29da63b5mr1143952685a.56.1792410442992;
        Mon, 19 Oct 2026 04:47:22 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c575esm19986031f8f.10.2026.10.19.04.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:47:21 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:47:19 +0300
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
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: pm8150l: add LCDB regulators
Message-ID: <gcsjw73m5tj42ftvhyckexor62waf5eydntycyy5qm7ubkesn4@qgr4ratyntfw>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-5-86c05068efc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-sm8150-display-card-v2-5-86c05068efc5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 0E_v44SLiwibqvgjxFlNK5Nw9RH_6Q8U
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX3S4NtwrYOcl7
 iCB7OeXQgHjFQ57xjoPZ2qn65SZHYAXmQp36tCtSbo5Jxr67oF46VqwfWDwWJ8biMmzLFqxcgTn
 gPjxNynFzjlBGERFiLj7taA0XRWqiF4=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad6034f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_xPOIdEwXcuG9LIM0_EA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 0E_v44SLiwibqvgjxFlNK5Nw9RH_6Q8U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfXzUdoG1tj6RB4
 7DWAq/tS3o2F4ThJyfb/QT4HnXzYano2ANrKQLSePco58ryyfX6Q8zThAbigdtlqqqETcB59FDx
 LhqpDtYXpKrKlhShBqs5GqNimo6kXwHxHUNoFzVEe8lU9I156bQmp2BGMzJf5bNgBimcPamRA7z
 Zf3V2J/v+9QuSkgTRqtIpwOpPVtOCXF6RgabfuDBUQFXiWMI3DpuJs/5IhHvvKF2OJZ4fxlBQRz
 Rz4YMPiUE3k3h+in+M3tcMg3qRPskbq8Up2NgVtbDXHeeKuLvIWdIfMFlQO70TqZOhaZ6SUfSkq
 EDDUYP0L7LppUY0it6wqKd18DAnLNJvt7B14BdDIduABmFXi/UCUC3fCb+rWrfm5srWMjyJyci5
 RAVQh3ALfdU4+F+pKogUGnvHO02T6ckSYHEYOZhGtIGP1tYGFsjoqlrhIkeqzg4PC7xDqV2m2hD
 UdG7TmZQ3KV5URx8BAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190046

On 26-10-19 14:25:41, Dmitry Baryshkov wrote:
> Describe the LCDB block providing the LCD bias rails. Leave empty
> regulator nodes, forcing board files to provide correct voltage.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
